import 'package:flutter/material.dart';
import 'space.dart';

class HomeWork11_Detial_View extends StatelessWidget {
  final Space? data;
  HomeWork11_Detial_View({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(this.data?.image ?? 'assets/images/spaces/space_1.jpg'),
            Text('${this.data?.description}' ?? '')
          ],
        ),
      ),
    );
  }
}
