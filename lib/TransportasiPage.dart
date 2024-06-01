import 'package:flutter/material.dart';

class TransportasiPage extends StatefulWidget {
  @override
  _TransportasiPageState createState() => _TransportasiPageState();
}

class _TransportasiPageState extends State<TransportasiPage> {
  List<Map<String, dynamic>> transportationData = [
    {
      'mode': 'Bus',
      'description': 'Kendaraan Bus.',
      'price': '\Rp.20.000',
    },
    {
      'mode': 'Becak',
      'description': 'Kendaraan Becak.',
      'price': '\Rp.10.000',
    },
    {
      'mode': 'Kereta Api',
      'description': 'Kendaraan Kereta Api.',
      'price': '\Rp.15.000',
    },
    // Add more transportation modes as needed
  ];

  List<Map<String, dynamic>> selectedTransportations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTransportationList(),
              SizedBox(height: 16),
              _buildSelectedTransportations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransportationList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Transportation',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        for (Map<String, dynamic> transportation in transportationData)
          _buildTransportationItem(
            mode: transportation['mode'],
            description: transportation['description'],
            price: transportation['price'],
          ),
      ],
    );
  }

  Widget _buildTransportationItem({
    required String mode,
    required String description,
    required String price,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addToSelectedTransportations(mode, price);
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedTransportations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Transportation',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        for (int index = 0; index < selectedTransportations.length; index++)
          _buildSelectedTransportationItem(
            index: index,
            mode: selectedTransportations[index]['mode'],
            price: selectedTransportations[index]['price'],
          ),
      ],
    );
  }

  Widget _buildSelectedTransportationItem({
    required int index,
    required String mode,
    required String price,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _removeFromSelectedTransportations(index);
                  },
                  child: Text('Remove'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _checkout(mode, price);
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addToSelectedTransportations(String mode, String price) {
    setState(() {
      selectedTransportations.add({
        'mode': mode,
        'price': price,
      });
    });
  }

  void _removeFromSelectedTransportations(int index) {
    setState(() {
      selectedTransportations.removeAt(index);
    });
  }

  void _checkout(String mode, String price) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Checkout'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Transportation: $mode'),
              SizedBox(height: 8),
              Text('Price: $price'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement the checkout action
                // For a static example, you can print a message
                print('Checkout successful!');
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
