import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceBearAPI extends StatefulWidget {
  @override
  _DiceBearAPIState createState() => _DiceBearAPIState();
}

class _DiceBearAPIState extends State<DiceBearAPI> {
  String avatarUrl = '';
  Random random = Random();

  void fetchAvatar() async {
    final styleName = 'bottts'; // Ganti dengan style yang Anda inginkan
    final seed = random.nextInt(9999); // Angka acak sebagai seed

    try {
      final dio = Dio();
      final apiUrl = 'https://api.dicebear.com/7.x/$styleName/svg?seed=$seed';
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        setState(() {
          avatarUrl = response.data;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiceBear Avatar Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (avatarUrl.isNotEmpty)
              SvgPicture.string(avatarUrl, height: 200, width: 200)
            else
              Text('Klik tombol untuk mengambil gambar avatar.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchAvatar,
              child: Text('Get Random Avatar'),
            ),
          ],
        ),
      ),
    );
  }
}
