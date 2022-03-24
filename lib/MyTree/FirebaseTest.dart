import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home/MyTree/MyTree.dart';

class firebase_Test{
  Future FirebaseStoreWriteTest() async{
    FirebaseFirestore.instance
        .collection('MyTree')
        .add({
      'user_name' : 'test'
  });
  }
    void FirebaseStroreReadTest(){
    FirebaseFirestore.instance
        .collection('MyTree')
        .doc('Ifh49ifvLOKkup7lSEH4')
        .get();
    }
}



