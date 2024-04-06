import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/advanced_homepage.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<String> images = [
    'lib/2_Flutter Introduction/8_MVVM Architecture/assets/1.jpg',
    'lib/2_Flutter Introduction/8_MVVM Architecture/assets/2.jpg',
    'lib/2_Flutter Introduction/8_MVVM Architecture/assets/3.png',
    'lib/2_Flutter Introduction/8_MVVM Architecture/assets/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gallery Gambar'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImageBottomSheet(context, images[index]);
            },
            child: Card(
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showImageBottomSheet(BuildContext context, String imagePath) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(imagePath),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('Ya'),
            onTap: () {
              Navigator.pop(context, true); // Pilih "Ya"
            },
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Tidak'),
            onTap: () {
              Navigator.pop(context, false); // Pilih "Tidak"
            },
          ),
        ],
      );
    },
  ).then((value) {
    // Setelah BottomSheet ditutup, Anda dapat menangani pilihan "Ya" atau "Tidak" di sini.
    if (value == true) {
      // Jika "Ya" dipilih, navigasi ke halaman baru atau lakukan tindakan lainnya.
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AdvancedHomePage()));
    }
  });
}
