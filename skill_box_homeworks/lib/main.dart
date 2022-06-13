// Flutter imports:
import 'package:flutter/material.dart';
import 'package:skill_box_homeworks/hw_10/login_view.dart';

// Project imports:
import 'package:skill_box_homeworks/hw_2.dart';
import 'package:skill_box_homeworks/hw_3.dart';
import 'package:skill_box_homeworks/hw_4.dart';
import 'package:skill_box_homeworks/hw_5.dart';
import 'package:skill_box_homeworks/hw_6/hw_6.dart';
import 'package:skill_box_homeworks/hw_7/hw_7.dart';
import 'package:skill_box_homeworks/hw_8.dart';
import 'package:skill_box_homeworks/hw_9/hw_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // HomeWork #2
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HW2Screen()));
                },
                child: Text('Go to Another Screen')
              ),

              // HomeWork #3
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork3()));
                  },
                  child: Text('Go to Home3 Screen')
              ),

              // HomeWork #4
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork4()));
                  },
                  child: Text('Go to Home4 Screen')
              ),

              // HomeWork #5
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork5()));
                  },
                  child: Text('Go to Home5 Screen')
              ),

              // HomeWork #6
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork6()));
                  },
                  child: Text('Go to Home6 Screen')
              ),

              // HomeWork #7
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HoweWork7()));
                  },
                  child: Text('Go to Home7 Screen')
              ),

              // HomeWork #8
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork8()));
                  },
                  child: Text('Go to Home8 Screen')
              ),

              // HomeWork #9
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWork9()));
                  },
                  child: Text('Go to Home9 Screen')
              ),

              // HomeWork #10
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text('Go to Home10 Screen')
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
