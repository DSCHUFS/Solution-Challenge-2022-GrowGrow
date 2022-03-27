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
  ImageProvider<Object> getimage(){
    if (Url == 'null'){
      return AssetImage('images/account.png');
    }
    else{
      return NetworkImage(Url!);
      //return AssetImage('images/account.png');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  foregroundImage: getimage(),
                ),
                currentAccountPictureSize: Size.square(70),
                accountEmail: Text('$Email', style: TextStyle(color:Colors.black)),
                accountName: Text('$Username', style: TextStyle(color:Colors.black)),
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(0, 20, 10, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: lightGreen, width: 2),
                  borderRadius: BorderRadius.all(
                      Radius.circular(15.0)),), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('images/tree_drawer.png', width: 40),
                          ),
                          Text('20', style: TextStyle(
                            fontFamily: 'Inter-Regular',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,))
                        ]
                      ),
                    ),
                    GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.control_point_duplicate,
                                size: 40,
                              ),
                            ),
                            Text('$userPoint', style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,)
    )
                          ],
                        )
                    ),
                  ],
                ),
                ),
              ListTile(
                leading: Icon(
                  Icons.star_border_rounded,
                ),
                title: Text('스크랩'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.campaign_outlined,
                ),
                title: Text('공지사항'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings
                ),
                title: Text('설정'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutWidget()),
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}



