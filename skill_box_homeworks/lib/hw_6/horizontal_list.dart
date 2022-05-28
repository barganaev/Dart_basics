import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  var list = new List<int>.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double _width = constraints.constrainWidth();

          print(_width);

          return _width < 500
              ? Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            list.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Container(
                                  height: 100, width: 100, color: Colors.green[index*100]),
                            )),
                      )),
                )
              // GridView.builder(
              //         scrollDirection: Axis.horizontal,
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: _width < 500 ? 1 : 3,
              //           childAspectRatio: _width < 500 ? 10 : 1,
              //         ),
              //         itemCount: list.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //             height: 80,
              //             width: 80,
              //             color: Colors.green[index*100],
              //           );
              //         }
              //     )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.green[index * 100],
                      ),
                    );
                  });
        },
      ),
    );
  }
}
