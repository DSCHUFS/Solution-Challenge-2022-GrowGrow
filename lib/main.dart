import 'package:flutter/material.dart';
import 'Home/Mainpage.dart';
import 'MyTree/MyTree.dart';
import 'News/NewsData.dart';
import 'News/NewsPage.dart';

void main() {
  runApp(const test());
}

NewsData newsData = NewsData();

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(primaryColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Home(),
              Text('Two'),
              NewsMain(),
              MyTree(),
            ],
          ),
          bottomNavigationBar: Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  icon: ImageIcon(
                    AssetImage('images/page1icon.png'),
                  ),
                  text: 'Main',
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('images/page2icon.png'),
                  ),
                  text: 'Campaign',
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('images/page3icon.png'),
                  ),
                  text: 'News',
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('images/page4icon.png'),
                  ),
                  text: 'Map',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

