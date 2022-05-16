// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_widget/main.dart';
import 'package:text_widget/provider/user_provider.dart';
import 'package:text_widget/signIn.dart';
import 'package:text_widget/test_page.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);
  static const String _title = 'Trang Chủ';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {



  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
  Container(
    child: SignIn(),
  ),
    Text(
      "name.toString()",
      style: optionStyle,
    ),
    DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: Colors.red,
            tabs: [
              Container(
                child: SignIn(),
              ),
              Text(
                'Cat',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              itemExtent: 106.0,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(children: <CustomListItem>[
                    CustomListItem(
                        thumbnail: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/dog1.jpg'),
                            ),
                          ),
                        ),
                        title: 'Chó trông nhà tên Trung',
                        user: 'Việt Nam',
                        viewCount: 100000),
                    CustomListItem(
                        thumbnail: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/cat1.jpg'),
                            ),
                          ),
                        ),
                        title: 'Mèo trông nhà tên Đạt',
                        user: 'Việt Nam',
                        viewCount: 100000),
                    // CustomListItem(
                    //     thumbnail: Container(
                    //       decoration: const BoxDecoration(color: Colors.blue),
                    //     ),
                    //     title: 'Chó trông nhà tên Tiến',
                    //     user: 'Việt Nam',
                    //     viewCount: 100000),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      child: TestPage(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => myApp()));
          },
        ),
        title: Text('Trang chủ'),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.deepPurple,
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            backgroundColor: Colors.green,
            label: 'Danh sách',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.add_photo_alternate_outlined),
            label: 'Ảnh',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.account_box),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  }) : super(key: key);
  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 2, child: thumbnail),
          Expanded(
            flex: 3,
            child:
                _ImageDogAndCat(title: title, user: user, viewCount: viewCount),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          )
        ],
      ),
    );
  }
}

class _ImageDogAndCat extends StatelessWidget {
  const _ImageDogAndCat({
    Key? key,
    required this.title,
    required this.user,
    required this.viewCount,
  }) : super(key: key);
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
