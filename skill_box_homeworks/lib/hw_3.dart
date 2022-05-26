// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeWork3 extends StatefulWidget {
  const HomeWork3({Key key}) : super(key: key);

  @override
  _HomeWork3State createState() => _HomeWork3State();
}

class _HomeWork3State extends State<HomeWork3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.02
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Task #1
              Center(child: Text('1. Flutter SVG', style: TextStyle(fontSize: 20),)),
              SvgPicture.asset('assets/Hot-Rod-Car-Show-2016070403.svg', width: MediaQuery.of(context).size.width * 0.7,),

              Divider(height: 30, color: Colors.black,),

              // Task #2
              Center(child: Text('2. Flutter Carousel', style: TextStyle(fontSize: 20),)),
              CarouselSlider(
                options: CarouselOptions(height: 400),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber
                        ),
                        child: Center(child: SvgPicture.asset('assets/Hot-Rod-Car-Show-2016070403.svg', width: MediaQuery.of(context).size.width * 0.8,),)
                        // Text('text $i', style: TextStyle(fontSize: 16),),
                      );
                    },
                  );
                }).toList(),
              ),

              Divider(height: 30, color: Colors.black,),

              // Task #3

            ],
          ),
        ),
      ),
    );
  }
}
