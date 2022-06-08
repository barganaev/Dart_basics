import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_box_homeworks/hw_9/item_model.dart';

class HomeWork9_Detail_Page extends StatefulWidget {
  String? uuid;
  HomeWork9_Detail_Page({Key? key, this.uuid}) : super(key: key);

  @override
  _HomeWork9_Detail_PageState createState() => _HomeWork9_Detail_PageState();
}

class _HomeWork9_Detail_PageState extends State<HomeWork9_Detail_Page> {
  bool isLoading = false;
  var itemDetail;
  bool hasError = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  /*Future<void> */ getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await http.get(Uri.parse('https://run.mocky.io/v3/${widget.uuid}'));
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        itemDetail = data;
        print(itemDetail.toString());
      } else {
        hasError = true;
      }
    } catch (e) {
      // hasError = true;
      throw Exception(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  List<String> images = [
    'assets/minion.jpg',
    'assets/road.jpg',
    'assets/minion.jpg',
    'assets/road.jpg',
    'assets/minion.jpg',
    'assets/road.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? const Center(
                  child: Text('Контент временно недоступен'),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(height: 200),
                        items: images.map((img) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  color: Colors.grey,
                                  child: Image.asset(
                                    img,
                                    fit: BoxFit.cover,
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  'Страна: ${itemDetail['address']['country']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  'Город: ${itemDetail['address']['city']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  'Улица: ${itemDetail['address']['street']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  'Рейтинг: ${itemDetail['rating']}'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Сервисы',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'Платные',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: (itemDetail['services']['paid'] as List).length,
                                        itemBuilder: (context, index) {
                                          return Text(itemDetail['services']['paid'][index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'Бесплатные',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: (itemDetail['services']['free'] as List).length,
                                        itemBuilder: (context, index) {
                                          return Text(itemDetail['services']['free'][index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
