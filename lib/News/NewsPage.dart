import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home/News/NewsData.dart';
import 'package:home/News/NewsReport.dart';
import 'package:home/News/NewsData.dart';
import 'package:home/resources.dart';
import 'NewsContainer.dart';
import 'package:home/main.dart';
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
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('News').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data?.docs.length,
              //itemCount: newsData.getNum(),
              itemBuilder: (BuildContext context, int index) => NewsContainer(
                index: index,
                title: snapshot.data!.docs[index]['Title'],
                writer: snapshot.data!.docs[index]['Writer'],
                tag1: snapshot.data!.docs[index]['Tag1'],
                tag2: snapshot.data!.docs[index]['Tag2'],
                report:snapshot.data!.docs[index]['Report'],
                answer: snapshot.data!.docs[index]['TestAnser'],
                question: snapshot.data!.docs[index]['TestQuestion'],
                type: snapshot.data!.docs[index]['TestType'],
                getpoint: snapshot.data!.docs[index]['QuestPoint'],
              ),
            ),
          );
        },
      ),
    );
  }
}

