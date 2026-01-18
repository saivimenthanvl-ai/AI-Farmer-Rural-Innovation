// Tab switching
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const tabName = btn.dataset.tab;
        
        // Update active tab button
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        
        // Update active tab content
        document.querySelectorAll('.tab-content').forEach(content => {
            content.classList.remove('active');
        });
        document.getElementById(`${tabName}-tab`).classList.add('active');
    });
});

// Image preview
document.getElementById('leaf-image').addEventListener('change', (e) => {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            document.getElementById('image-preview').innerHTML = 
                `<img src="${e.target.result}" alt="Leaf preview">`;
        };
        reader.readAsDataURL(file);
    }
});

// Show/hide loading
function showLoading() {
    document.getElementById('loading').classList.add('show');
}

function hideLoading() {
    document.getElementById('loading').classList.remove('show');
}

// Text Query
async function submitTextQuery() {
    const query = document.getElementById('text-query').value.trim();
    const language = document.getElementById('text-language').value;
    
    if (!query) {
        alert('Please enter a question');
        return;
    }
    
    showLoading();
    
    try {
        const response = await fetch('/text-query', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                query_type: 'text',
                text: query,
                language: language
            })
        });
        
        const data = await response.json();
        displayTextResponse(data);
    } catch (error) {
        displayError('text-response', error.message);
    } finally {
        hideLoading();
    }
}

function displayTextResponse(data) {
    const responseBox = document.getElementById('text-response');
    let html = `<h3>Response</h3><p>${data.response_text}</p>`;
    
    if (data.market_data && data.market_data.length > 0) {
        html += '<div class="market-prices">';
        data.market_data.forEach(price => {
            html += `
                <div class="price-card">
                    <h4>${price.market}</h4>
                    <div class="price">₹${price.price}</div>
                    <p>${price.crop}</p>
                </div>
            `;
        });
        html += '</div>';
    }
    
    if (data.schemes && data.schemes.length > 0) {
        data.schemes.forEach(scheme => {
            html += `
                <div class="scheme-card">
                    <h4>${scheme.name}</h4>
                    <p>${scheme.description}</p>
                    <p><strong>Benefits:</strong> ${scheme.benefits}</p>
                    <p><strong>How to Apply:</strong> ${scheme.how_to_apply}</p>
                </div>
            `;
        });
    }
    
    responseBox.innerHTML = html;
    responseBox.classList.add('show');
}

// Leaf Analysis
async function analyzeLeaf() {
    const fileInput = document.getElementById('leaf-image');
    const language = document.getElementById('image-language').value;
    
    if (!fileInput.files[0]) {
        alert('Please select an image');
        return;
    }
    
    showLoading();
    
    const formData = new FormData();
    formData.append('file', fileInput.files[0]);
    formData.append('language', language);
    
    try {
        const response = await fetch(`/analyze-leaf?language=${language}`, {
            method: 'POST',
            body: formData
        });
        
        const data = await response.json();
        displayImageResponse(data);
    } catch (error) {
        displayError('image-response', error.message);
    } finally {
        hideLoading();
    }
}

function displayImageResponse(data) {
    const responseBox = document.getElementById('image-response');
    let html = `<h3>Analysis Result</h3><p>${data.response_text}</p>`;
    
    if (data.disease_info) {
        const disease = data.disease_info;
        html += `
            <div class="disease-info">
                <h4>🔍 ${disease.name}</h4>
                <p><strong>Confidence:</strong> ${(disease.confidence * 100).toFixed(1)}%</p>
                <p><strong>Severity:</strong> ${disease.severity}</p>
                <h4>Treatment Recommendations:</h4>
                <ul class="treatment-list">
                    ${disease.treatment.map(t => `<li>${t}</li>`).join('')}
                </ul>
            </div>
        `;
    }
    
    responseBox.innerHTML = html;
    responseBox.classList.add('show');
}

// Market Prices
async function getMarketPrices() {
    const crop = document.getElementById('crop-select').value;
    
    showLoading();
    
    try {
        const response = await fetch(`/market-prices/${crop}`);
        const data = await response.json();
        displayMarketPrices(data);
    } catch (error) {
        displayError('market-response', error.message);
    } finally {
        hideLoading();
    }
}

function displayMarketPrices(data) {
    const responseBox = document.getElementById('market-response');
    let html = `<h3>Market Prices for ${data.crop}</h3>`;
    
    if (data.prices && data.prices.length > 0) {
        html += '<div class="market-prices">';
        data.prices.forEach(price => {
            html += `
                <div class="price-card">
                    <h4>${price.market}</h4>
                    <div class="price">₹${price.price}</div>
                    <p>Updated: ${new Date(price.timestamp).toLocaleString()}</p>
                </div>
            `;
        });
        html += '</div>';
    } else {
        html += '<p>No price data available for this crop.</p>';
    }
    
    responseBox.innerHTML = html;
    responseBox.classList.add('show');
}

// Government Schemes
async function getSchemes() {
    const query = document.getElementById('scheme-query').value.trim();
    
    showLoading();
    
    try {
        const url = query ? `/schemes?query=${encodeURIComponent(query)}` : '/schemes';
        const response = await fetch(url);
        const data = await response.json();
        displaySchemes(data);
    } catch (error) {
        displayError('schemes-response', error.message);
    } finally {
        hideLoading();
    }
}

function displaySchemes(data) {
    const responseBox = document.getElementById('schemes-response');
    let html = '<h3>Available Government Schemes</h3>';
    
    if (data.schemes && data.schemes.length > 0) {
        data.schemes.forEach(scheme => {
            html += `
                <div class="scheme-card">
                    <h4>${scheme.name}</h4>
                    <p>${scheme.description}</p>
                    <p><strong>Eligibility:</strong></p>
                    <ul>
                        ${scheme.eligibility.map(e => `<li>${e}</li>`).join('')}
                    </ul>
                    <p><strong>Benefits:</strong> ${scheme.benefits}</p>
                    <p><strong>How to Apply:</strong> ${scheme.how_to_apply}</p>
                </div>
            `;
        });
    } else {
        html += '<p>No schemes found.</p>';
    }
    
    responseBox.innerHTML = html;
    responseBox.classList.add('show');
}

// Error display
function displayError(elementId, message) {
    const responseBox = document.getElementById(elementId);
    responseBox.innerHTML = `<div class="error">Error: ${message}</div>`;
    responseBox.classList.add('show');
}
