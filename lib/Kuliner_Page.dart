import 'package:flutter/material.dart';

class KulinerPage extends StatefulWidget {
  @override
  _KulinerPageState createState() => _KulinerPageState();
}

class _KulinerPageState extends State<KulinerPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = "";

  List<String> kulinerData = [
    'Nasi Goreng',
    'Sate Ayam',
    'Pliek',

    // Tambahkan kuliner lainnya sesuai kebutuhan
  ];

  List<Map<String, String>> articles = [
    {
      'title': 'Nasi Goreng',
      'description':
          'Nasi goreng adalah makanan berupa nasi yang digoreng dan dicampur dalam minyak goreng, margarin, atau mentega.',
    },
    {
      'title': 'Sate Ayam',
      'description':
          'Pada umumnya sate ayam dimasak dengan cara dipanggang dengan menggunakan arang dan disajikan dengan pilihan bumbu kacang atau bumbu kecap.',
    },
    {
      'title': 'Pliek',
      'description':
          'Masakan ini memiliki bahan dasar ampas dari sisa minyak kelapa tua yang telah melalui proses pemerasan minyaknya',
    },
    // Tambahkan artikel lainnya sesuai kebutuhan
  ];

  List<String> filteredKulinerData = [];
  List<Map<String, String>> filteredArticles = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi filteredArticles dengan semua artikel
    filteredArticles = List<Map<String, String>>.from(articles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuliner Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildKulinerDescription(),
              SizedBox(height: 16),
              _buildArticlesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() {
          _searchTerm = value;
          _performSearch();
        });
      },
      decoration: InputDecoration(
        hintText: 'Search Kuliner...',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _performSearch();
          },
        ),
      ),
    );
  }

  void _performSearch() {
    filteredKulinerData = kulinerData
        .where((kuliner) =>
            kuliner.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    filteredArticles = articles
        .where((article) =>
            article['title']!
                .toLowerCase()
                .contains(_searchTerm.toLowerCase()) ||
            article['description']!
                .toLowerCase()
                .contains(_searchTerm.toLowerCase()))
        .toList();
  }

  Widget _buildKulinerDescription() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ini Adalah Halaman Untuk Kuliner.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticlesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String kuliner in filteredKulinerData)
          _buildArticleItem(
            title: kuliner,
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imageOnLeft: true,
          ),
        SizedBox(height: 16),
        Text(
          'Featured Articles',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        for (Map<String, String> article in filteredArticles)
          _buildArticleItem(
            title: article['title']!,
            description: article['description']!,
            imageOnLeft: true,
          ),
      ],
    );
  }

  Widget _buildArticleItem({
    required String title,
    required String description,
    bool imageOnLeft = true,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageOnLeft) _buildArticleImage(title),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          if (!imageOnLeft) _buildArticleImage(title),
        ],
      ),
    );
  }

  Widget _buildArticleImage(String title) {
    return Image.asset(
      _getKulinerImage(title),
      height: 80,
      width: 70,
      fit: BoxFit.cover,
    );
  }

  String _getKulinerImage(String kuliner) {
    return 'images/kuliner_images/${kuliner.toLowerCase().replaceAll(' ', '_')}.jpg';
  }
}
