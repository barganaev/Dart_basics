import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath).then((file) => file.toString());
}

class HomeWork8 extends StatefulWidget {
  const HomeWork8({Key key}) : super(key: key);

  @override
  _HomeWork8State createState() => _HomeWork8State();
}

class _HomeWork8State extends State<HomeWork8> {
  final textController = TextEditingController();
  bool isFileFounded = false;
  String Ftext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              TextField(
                controller: textController,
                onChanged: (e) {
                  setState(() {
                    Ftext = e;
                  });
                  print('$e');
                },
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.purple),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (Ftext == 'future_text') {
                            isFileFounded = true;
                          } else {
                            isFileFounded = false;
                          }
                          setState(() {});
                        },
                        icon: Icon(Icons.search),
                        color: Colors.purple),
                    labelText: 'Search',
                    hintText: 'Введите значение',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(15))),
              ),
              isFileFounded == true
                  ? FutureBuilder(
                      future:
                          fetchFileFromAssets('assets/data/future_text.txt'),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.done:
                            return Text('${snapshot.data}');
                          default:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                        }
                      })
                  : Center(
                      child: Text('Файл не найден'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
