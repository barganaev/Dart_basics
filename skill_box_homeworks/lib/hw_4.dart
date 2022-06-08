import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';

class HomeWork4 extends StatefulWidget {
  HomeWork4({Key? key}) : super(key: key);

  @override
  _HomeWork4State createState() => _HomeWork4State();
}

class _HomeWork4State extends State<HomeWork4> {
  final List<String> nav = ['Список 1', 'Список 2'];
  final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length/*data.length*/,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Homework #4'),
          bottom: TabBar(
            tabs: data.keys/*nav*/.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: data.keys.map((name) {
            return ListView(
              key: PageStorageKey(name),
              children: <Widget>[
                ...data[name].map((value) => Image.network(value.toString()))
                // ...data.values.map((list_of_pictures) {
                //   for (String picture in list_of_pictures) {
                //     return Image.network(picture);
                //   }
                // }).toList()
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
