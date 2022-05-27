import 'package:flutter/material.dart';

class HomeWork5 extends StatefulWidget {
  const HomeWork5({Key key}) : super(key: key);

  @override
  _HomeWork5State createState() => _HomeWork5State();
}

class _HomeWork5State extends State<HomeWork5> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeWork #5'),
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // elevation: 10,
        // notchMargin: 8,
        // clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "AccountBox",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Modal Bottom Sheet'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close Bottom Sheet')
                    )
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
