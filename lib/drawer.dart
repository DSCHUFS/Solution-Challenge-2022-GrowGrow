import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home/Home/printImage.dart';
import 'package:home/login.dart';
import 'resources.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  ImageProvider<Object> getimage() {
    if (Url == 'null') {
      return AssetImage('images/account.png');
    } else {
      return NetworkImage(Url!);
      //return AssetImage('images/account.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: getimage(),
              ),
              currentAccountPictureSize: Size.square(70),
              accountEmail:
                  Text('$Email', style: TextStyle(color: Colors.black)),
              accountName:
                  Text('$Username', style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
              decoration: BoxDecoration(
                border: Border.all(color: lightGreen, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('images/tree_drawer.png', width: 40),
                    ),
                    Text('$tree',
                        style: TextStyle(
                          fontFamily: 'Inter-Regular',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.control_point_duplicate,
                          size: 40,
                        ),
                      ),
                      Text('$userPoint',
                          style: TextStyle(
                            fontFamily: 'Inter-Regular',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
              ),
              title: Text('스크랩'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.campaign_outlined,
              ),
              title: Text('공지사항'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Logout'),
              onTap: () {
                LogoutDialog(context);
                /*
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogoutWidget()));

                 */
              },
            ),
          ],
        ),
      ),
    );
  }
}

void LogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Log Out"),
        content: Text("See you again"),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(
                color: Color(0xff41B06B),
                width: 3.0,
              ),
            ),
            child: Text("Log out",style: TextStyle(color: Colors.black),),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(
                color: Color(0xff41B06B),
                width: 3.0,
              ),
            ),
            child: Text("Cancel",style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
