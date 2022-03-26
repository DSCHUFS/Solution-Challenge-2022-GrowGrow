import 'package:flutter/material.dart';
import 'Campaign/cpmain.dart';
import 'Home/Mainpage.dart';
import 'MyTree/MyTree.dart';
import 'News/NewsData.dart';
import 'News/NewsPage.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const test());
}

NewsData newsData = NewsData();

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginTest(),
    );
  }
}

//tap & slide
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
              CampaignMain(),
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
                  text: 'MyTree',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//only tap
class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int CurrentIndex = 0;
  final List<Widget> Pages = [Home(), CampaignMain(), NewsMain(), MyTree()];
  void tap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Pages[CurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: tap,
          currentIndex: CurrentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/page1icon.png'),
              ),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/page2icon.png'),
              ),
              label: 'Campaign',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/page3icon.png'),
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/page4icon.png'),
              ),
              label: 'MyTree',
            )
          ],
        ),
      ),
    );
  }
}
