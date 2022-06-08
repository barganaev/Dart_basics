import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_box_homeworks/hw_9/hw_9_detail_page.dart';
import 'package:skill_box_homeworks/hw_9/item_model.dart';

class HomeWork9 extends StatefulWidget {
  const HomeWork9({Key key}) : super(key: key);

  @override
  _HomeWork9State createState() => _HomeWork9State();
}

class _HomeWork9State extends State<HomeWork9> {
  bool isLoading = false;
  bool isListView = true;
  bool hasError = false;
  var items;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse(
          'https://run.mocky.io/v3/e6d06543-b2ad-497c-8877-36c334a52893'));
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        items = data.map<Item>((item) => Item.fromJson(item)).toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = true;
                });
              },
              icon: Icon(Icons.list)),
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = false;
                });
              },
              icon: Icon(Icons.apps)),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Text('Контент временно недоступен'),
                )
              : isListView
                  ? ListView(
                      children: [
                        ...items.map((item) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: Image.network(
                                            item.postt.toString())),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${item.name}'),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeWork9_Detail_Page(
                                                    uuid: item.uuid,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text('Подробнее'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      ],
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      children: [
                        ...items.map((item) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        child: Image.network(
                                            item.postt.toString())),
                                    Text('${item.name}',
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeWork9_Detail_Page(
                                                  uuid: item.uuid,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text('Подробнее'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      ],
                    ),
    );
  }
}
