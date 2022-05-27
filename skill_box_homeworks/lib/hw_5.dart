import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem({this.title, this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Home', icon: Icon(Icons.home)),
  TabItem(title: 'Favorite', icon: Icon(Icons.favorite)),
  TabItem(title: 'AccountBox', icon: Icon(Icons.account_box)),
];

class HomeWork5 extends StatefulWidget {
  const HomeWork5({Key key}) : super(key: key);

  @override
  _HomeWork5State createState() => _HomeWork5State();
}

class _HomeWork5State extends State<HomeWork5> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // void openEndDrawer() {
  //   scaffoldKey.currentState.openEndDrawer();
  // }

  TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeWork #5'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.account_box)
              ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/minion.jpg', ),
            ),
            SizedBox(height: 10,),
            Text('SkillBox User')
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                  'assets/minion.jpg'
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.perm_contact_cal),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Images'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Выход')),
                    ElevatedButton(onPressed: () {}, child: Text('Регистрация')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.green,
            child: Center(
              child: Text('111')
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text('222')
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('333')
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // elevation: 10,
        // notchMargin: 8,
        // clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _tabController.index = index;
                _currentTabIndex = index;
              });
            },
            currentIndex: _currentTabIndex,
            elevation: 0,
            items: [
              for (final item in _tabBar)
                BottomNavigationBarItem(
                  label: item.title,
                  icon: item.icon
                )
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
