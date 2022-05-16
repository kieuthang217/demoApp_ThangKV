import 'package:flutter/material.dart';

class Image extends StatelessWidget {
   Image({Key? key}) : super(key: key);

  static const String _title = 'APP Dog and Cat';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: ImageDogCat(),
    );
  }
}
class ImageDogCat extends StatelessWidget {
  const ImageDogCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trang chủ'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.foggy),),
              Tab(icon: Icon(Icons.catching_pokemon),)
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('Dog'),
            ),
            Center(
              child: Text('cat'),
            )

          ],
        ),
      ),
    );
  }
}

