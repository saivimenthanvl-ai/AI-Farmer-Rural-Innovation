import 'package:flutter/material.dart';

class DiseaseDetailScreen extends StatelessWidget {
  final String diseaseName;
  final String scientificName;
  final int confidence;

  const DiseaseDetailScreen({
    super.key,
    required this.diseaseName,
    required this.scientificName,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.grass,
                      size: 100,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            diseaseName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '($scientificName)',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Confidence: $confidence%',
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExpandableSection(
                    'Why this disease?',
                    'Early blight is a common fungal disease affecting many plants, especially potatoes and tomatoes. It is caused by the fungus Alternaria solani. The disease typically manifests as dark brown to black spots, often with concentric rings, resembling a target pattern. These spots usually appear on older leaves first and can enlarge, causing the leaves to turn yellow, shrivel, and fall off. Humid weather and prolonged periods of leaf wetness favor disease development. Understanding these conditions helps in effective management.',
                    Icons.help_outline,
                  ),
                  const SizedBox(height: 12),
                  _buildExpandableSection(
                    'Treatment Actions',
                    '• Remove and destroy infected leaves\n• Apply fungicides containing chlorothalonil or copper\n• Improve air circulation around plants\n• Water at the base to keep foliage dry\n• Rotate crops annually\n• Use disease-resistant varieties',
                    Icons.medical_services,
                  ),
                  const SizedBox(height: 12),
                  _buildExpandableSection(
                    'Prevention Tips',
                    '• Maintain proper plant spacing\n• Avoid overhead watering\n• Apply mulch to prevent soil splash\n• Remove plant debris regularly\n• Monitor plants weekly for early signs',
                    Icons.shield,
                  ),
                  const SizedBox(height: 12),
                  _buildExpandableSection(
                    'Recommended Products',
                    '• Mancozeb 75% WP\n• Copper Oxychloride 50% WP\n• Azoxystrobin 23% SC\n• Chlorothalonil 75% WP',
                    Icons.shopping_bag,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection(String title, String content, IconData icon) {
    return Card(
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              content,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
