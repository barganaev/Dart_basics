import 'package:flutter/material.dart';
import 'package:skill_box_homeworks/hw_6/horizontal_list.dart';
import 'package:skill_box_homeworks/hw_6/list_view_divider.dart';
import 'package:skill_box_homeworks/hw_6/sliver_widgets.dart';
import 'package:skill_box_homeworks/hw_6/text_field_styled.dart';

class HomeWork6 extends StatefulWidget {
  const HomeWork6({Key? key}) : super(key: key);

  @override
  _HomeWork6State createState() => _HomeWork6State();
}

class _HomeWork6State extends State<HomeWork6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeWork #6"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // List View Divider
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewDivider()));
              },
              child: Text('List View Divider Page')
            ),

            // Sliver Widgets
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SliverWidgets()));
                },
                child: Text('Sliver Widgets Page')
            ),

            // Horizontal List
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HorizontalList()));
                },
                child: Text('Horizontal List Page')
            ),

            // Text Field Styled
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TextFieldStyled()));
                },
                child: Text('Text Field Styled Page')
            ),
          ],
        ),
      ),
    );
  }
}
