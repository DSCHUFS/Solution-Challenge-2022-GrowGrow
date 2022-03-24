import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Home/resources.dart';
import 'Marker.dart';
import 'package:firebase_core/firebase_core.dart';

import 'MyTreeContainer.dart';

class MyTree extends StatefulWidget {
  @override
  State<MyTree> createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyTree', style: TextStyle(color: darkGrey)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Builder(builder: (context){
            return Padding(
              padding: const EdgeInsets.all(11.0),
              child: GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            );
          }),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xff81dfa4),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 400,
                    child: MapSample(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xff81dfa4),
                      width: 3,
                    ),
                  ),
                  child: TreeList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeList extends StatefulWidget {
  const TreeList({Key? key}) : super(key: key);

  @override
  State<TreeList> createState() => _TreeListState();
}

class _TreeListState extends State<TreeList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('MyTreeList').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Container(
          child: ListView.builder(
            itemCount: snapshot.data?.docs.length,
            //itemCount: newsData.getNum(),
            itemBuilder: (BuildContext context, int index) => MyTreeContainer(
              //index: index,
              usernum: snapshot.data!.docs[index]['UserNum'],
              location : snapshot.data!.docs[index]['Location'],
              date : snapshot.data!.docs[index]['Date'],
              imagenum : snapshot.data!.docs[index]['ImageNum'],
            ),
          ),
        );
      },
    );
  }
}
