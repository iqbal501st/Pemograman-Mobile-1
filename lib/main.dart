import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Kuliner_Page.dart';
import 'Popular_Page.dart';
import 'TransportasiPage.dart';
import 'about_lhokseumawe_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoHub',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  // Fungsi untuk membuka aplikasi telepon dengan nomor darurat
  void _callEmergencyNumber() async {
    const phoneNumber =
        'tel:+62872727396'; // Ganti dengan nomor darurat yang sesuai
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Membuka Drawer
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            );
          },
        ),
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _callEmergencyNumber(); // Panggil fungsi ketika tombol ditekan
            },
            icon: const Icon(Icons.emergency),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Muhammad Iqbal"),
              accountEmail: Text("abcdf@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),

            ListTile(
              title: const Text('About Lhokseumawe'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutLhokseumawePage()),
                );
              },
            ),
            // ...Tambahkan item-item lainnya
          ],
        ),
      ),
      body: IndexedStack(
        index: 0, // Index 0 untuk HomePageContent
        children: [
          HomePageContent(),
          KulinerPage(),
          TransportasiPage(),
          PopularPage(),
          // Tambahkan halaman lain jika diperlukan
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.purple,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.purple,
        height: 50,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.restaurant, size: 30),
          Icon(Icons.directions_bus, size: 30),
          Icon(Icons.star, size: 30),
        ],
        onTap: (index) {
          // Handle button tap
          switch (index) {
            case 0:
              // Halaman utama
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KulinerPage()),
              );
              break;
            case 2:
              // Halaman transportasi
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransportasiPage()),
              );
              break;
            case 3:
              // Halaman pemesanan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PopularPage()),
              );
              break;
            case 4:
              // Halaman populer

              break;
          }
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildArticle(
          title: 'Rekomendasi Kuliner',
          content:
              'Mie Aceh, Ialah salah satu rekomendasi kuliner di lhokseumawe.',
          assetPath: 'images/mie.jpg',
        ),
        _buildArticle(
          title: 'Tempat Populer',
          content:
              'Pantai, Ialah salah satu rekomendasi Tempat populer di lhokseumawe.',
          assetPath: 'images/pante.jpg',
        ),
        _buildArticle(
          title: 'Transportasi Terbaik',
          content:
              'Kereta Api, Ialah salah satu rekomendasi Transportasi di lhokseumawe..',
          assetPath: 'images/kereta.jpg',
        ),
      ],
    );
  }

  Widget _buildArticle({
    required String title,
    required String content,
    required String assetPath,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image on the left
            Expanded(
              flex: 2,
              child: Image.asset(
                assetPath,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8.0),
            // Text on the right
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
