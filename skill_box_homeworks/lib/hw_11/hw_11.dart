import 'package:flutter/material.dart';
import 'package:skill_box_homeworks/hw_11/hw_11_detail_view.dart';
import 'package:skill_box_homeworks/hw_11/space.dart';

class HomeWork11 extends StatefulWidget {
  const HomeWork11({Key? key}) : super(key: key);

  @override
  _HomeWork11State createState() => _HomeWork11State();
}

class _HomeWork11State extends State<HomeWork11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...spaces.map((space) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeWork11_Detial_View(data: space)
                    )
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                  ),
                  child: Card(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Hero(
                      tag: space.id ?? 0,
                      child: Container(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)
                              ),
                              child: AspectRatio(
                                aspectRatio: 16/4,
                                child: Image(
                                  image: AssetImage(space.image ?? 'assets/images/spaces/space_1.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              )
                              // Image.asset(
                              //   space.image ?? 'assets/images/spaces/space_1.jpg',
                              // )
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20
                              ),
                              child: Text(space.description ?? '', overflow: TextOverflow.ellipsis,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
              //   Hero(
              //   tag: e.id ?? 0,
              //   child: CircleAvatar(
              //     radius: 60,
              //     backgroundImage: AssetImage(e.image ?? 'assets/images/spaces/space_1.jpg'),
              //   )
              // );
            }).toList()
          ],
        ),
      ),
    );
  }
}
