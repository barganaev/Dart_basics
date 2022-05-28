import 'package:flutter/material.dart';

class ListViewDivider extends StatefulWidget {
  const ListViewDivider({Key key}) : super(key: key);

  @override
  _ListViewDividerState createState() => _ListViewDividerState();
}

class _ListViewDividerState extends State<ListViewDivider> {
  var listData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('$index'),
                )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              )
            ],
          );
        }
      ),
    );
  }
}
