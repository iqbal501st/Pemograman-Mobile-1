// File: about_lhokseumawe_page.dart
import 'package:flutter/material.dart';

class AboutLhokseumawePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Lhokseumawe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/lhokseumawe.jpg',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Lhokseumawe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Lhokseumawe adalah sebuah kota yang terletak di provinsi Aceh, Indonesia. Kota ini memiliki sejarah dan budaya yang kaya, serta keindahan alam yang memukau.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
