import 'package:flutter/material.dart';

class ArtistsDetail extends StatefulWidget {
  String name;
  String desc;
  ArtistsDetail({Key key, this.name, this.desc}) : super(key: key);

  @override
  _ArtistsDetailState createState() => _ArtistsDetailState();
}

class _ArtistsDetailState extends State<ArtistsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Text('${widget.desc}'),
      ),
    );
  }
}
