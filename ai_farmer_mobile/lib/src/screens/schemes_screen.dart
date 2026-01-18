import 'package:flutter/material.dart';

class SchemesScreen extends StatefulWidget {
  const SchemesScreen({super.key});

  @override
  State<SchemesScreen> createState() => _SchemesScreenState();
}

class _SchemesScreenState extends State<SchemesScreen> {
  String? _selectedState;
  String? _selectedCrop;
  String? _landOwnership;
  double _farmSize = 5;

  final List<Map<String, dynamic>> _schemes = [
    {
      'name': 'Pradhan Mantri Fasal Bima Yojana',
      'status': 'Eligible',
      'description': 'Provides insurance coverage and financial support to farmers in the event of failure of any of the notified crops as a result of natural calamities.',
      'icon': Icons.security,
      'color': Colors.green,
    },
    {
      'name': 'Kisan Credit Card (KCC) Scheme',
      'status': 'Recommended',
      'description': 'A credit scheme providing farmers with timely and adequate credit support from the banking system for their cultivation needs.',
      'icon': Icons.credit_card,
      'color': Colors.orange,
    },
    {
      'name': 'Soil Health Card Scheme',
      'status': 'Eligible',
      'description': 'A scheme to provide every farmer with a Soil Health Card once in 3 years. The card carries crop-wise recommendations of nutrients & fertilizers.',
      'icon': Icons.eco,
      'color': Colors.blue,
    },
    {
      'name': 'National Food Security Mission',
      'status': 'Recommended',
      'description': 'Aims to increase production of rice, wheat, pulses, coarse cereals and commercial crops through area expansion and productivity.',
      'icon': Icons.restaurant,
      'color': Colors.red,
    },
    {
      'name': 'PM Kisan Samman Nidhi',
      'status': 'Not Applicable',
      'description': 'Provides income support to all eligible farmer families across the country to enable them to take care of expenses related to agriculture.',
      'icon': Icons.account_balance_wallet,
      'color': Colors.grey,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Schemes'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Check Eligibility for Schemes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'State',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedState,
                decoration: InputDecoration(
                  hintText: 'Select your state',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: ['Maharashtra', 'Punjab', 'Karnataka', 'Tamil Nadu']
                    .map((state) => DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedState = value),
              ),
              const SizedBox(height: 16),
              const Text(
                'Crop Type',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedCrop,
                decoration: InputDecoration(
                  hintText: 'Select crop type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: ['Wheat', 'Rice', 'Cotton', 'Sugarcane', 'Maize']
                    .map((crop) => DropdownMenuItem(
                          value: crop,
                          child: Text(crop),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCrop = value),
              ),
              const SizedBox(height: 16),
              const Text(
                'Land Ownership',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Owned'),
                      value: 'Owned',
                      groupValue: _landOwnership,
                      onChanged: (value) => setState(() => _landOwnership = value),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Leased'),
                      value: 'Leased',
                      groupValue: _landOwnership,
                      onChanged: (value) => setState(() => _landOwnership = value),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Farm Size (acres): ${_farmSize.toInt()}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Slider(
                value: _farmSize,
                min: 1,
                max: 50,
                divisions: 49,
                label: _farmSize.toInt().toString(),
                onChanged: (value) => setState(() => _farmSize = value),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Check Eligibility'),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Available Schemes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ..._schemes.map((scheme) => _buildSchemeCard(scheme)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchemeCard(Map<String, dynamic> scheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(scheme['icon'], color: scheme['color']),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    scheme['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(scheme['status']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    scheme['status'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              scheme['description'],
              style: const TextStyle(color: Colors.grey, height: 1.4),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Eligible':
        return Colors.green;
      case 'Recommended':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
