import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:skill_box_homeworks/hw_7/artists_detail.dart';

import 'artists_model.dart';


class HoweWork7 extends StatefulWidget {
  const HoweWork7({Key? key}) : super(key: key);

  @override
  _HoweWork7State createState() => _HoweWork7State();
}

class _HoweWork7State extends State<HoweWork7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                /// TODO: Use Router, NOT Navigator!!!
                onPressed: () {
                  Navigator.pushNamed(context, "FirstPage");
                },
                child: Text('Home')
              ),

              /// TODO: Use Router, NOT Navigator!!!
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "SecondPage");
                },
                child: Text('Albums')
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text('${data.error}'),);
          } else if (data.hasData) {
            var artists = data.data as List<DataModel>;
            log(artists.toString(), name: 'Fetch Data');
            return ListView.builder(
              itemCount: artists == null ? 0 : artists.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    /// TODO: Use router, NOT Navigator!!!
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => ArtistsDetail(
                          name: artists[index].name,
                          desc: artists[index].description
                        )
                      )
                    );
                  },
                  child: ListTile(
                    title: Text('${artists[index].name}'),
                  ),
                );
              }
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<DataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/data/artists.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DataModel.fromJson(e)).toList();
  }
}
