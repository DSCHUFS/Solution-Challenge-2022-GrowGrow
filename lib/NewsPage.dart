import 'package:flutter/material.dart';
import 'package:home/NewsData.dart';
import 'package:home/NewsReport.dart';
import 'package:home/NewsData.dart';
import 'package:home/resources.dart';
import 'NewsContainer.dart';
import 'main.dart';
import 'package:home/drawer.dart';

class NewsMain extends StatelessWidget {
  const NewsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News', style: TextStyle(color: darkGrey)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xff81dfa4),
                      width: 3,
                    ),
                  ),
                  child: TextFormField(
                    onChanged: (value) => (value),
                    decoration: const InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 12.0,right: 12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff41B06B),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white),
                    iconSize: 35,
                  ),
                ),
              )
            ],
          ),
        ),
        leading: Builder(builder: (context){
          return Padding(
            padding: const EdgeInsets.all(11.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/account.png'),
                  ),
                  border: Border.all(color: deepGreen, width: 1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
      ),
      body:ListView.builder(
        itemCount: newsData.getNum(),
        itemBuilder: (BuildContext context, int index) => NewsContainer(
          index: index,
        ),
      ),
    );
  }
}

