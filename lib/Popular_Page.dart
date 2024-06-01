import 'package:flutter/material.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPage createState() => _PopularPage();
}


class _PopularPage extends State<PopularPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = "";

  List<String> PopularData = [
    'Goa Jepang',
    'Museum',
    'Waduk',
    // Tambahkan kuliner lainnya sesuai kebutuhan
  ];

  List<Map<String, String>> articles = [
    {
      'title': 'Goa Jepang',
      'description':
          'Letaknya berada di desa Blang Panyang, Kec. Muara Satu, Kota Lhokseumawe. .',
    },
    {
      'title': 'Museum',
      'description':
          'Museum Kota Lhokseumawe adalah museum yang terletak di Kota Lhokseumawe yang berdiri pada tahun 2014.',
    },
    {
      'title': 'Waduk',
      'description':
          'Waduk pusong adalah obyek wisata yang ada di Lhokseumawe terletak di jalan reklamasi, kecamtan Banda sakti.',
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
        title: Text('Tempat Populer'),
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
        hintText: 'Search Tempat Populer...',
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
    filteredKulinerData = PopularData.where((kuliner) =>
        kuliner.toLowerCase().contains(_searchTerm.toLowerCase())).toList();

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
                'Ini Adalah Halaman Untuk Tempat Populer.',
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
      _getPopularImage(title),
      height: 80,
      width: 70,
      fit: BoxFit.cover,
    );
  }

  // Metode untuk mendapatkan gambar kuliner berdasarkan nama kuliner
  String _getPopularImage(String kuliner) {
    // Implementasikan logika sesuai dengan struktur nama gambar kuliner
    // Misalnya, jika nama kuliner adalah 'Nasi Goreng', maka gambar bisa disebut 'nasi_goreng.jpg'
    // Sesuaikan dengan struktur nama gambar yang sesuai dengan proyek Anda
    return 'images/popular_images/${kuliner.toLowerCase().replaceAll(' ', '_')}.jpg';
  }
}
