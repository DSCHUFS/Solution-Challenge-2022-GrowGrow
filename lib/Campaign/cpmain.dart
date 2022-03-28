import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources.dart';
import 'CampaignData.dart';
import 'CampaignUI.dart';


CampaignData campaignData = CampaignData();

class CampaignMain extends StatelessWidget {
    const CampaignMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campaign', style: TextStyle(color: darkGrey,fontSize: 25,)),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: Colors.white,
    ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Campaign').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) => CampaignUI(
                campaigntitle: snapshot.data!.docs[index]['Title'],
                like: snapshot.data!.docs[index]['Like'],
                scrap: snapshot.data!.docs[index]['Scrap'],
                info: snapshot.data!.docs[index]['Info'],
                image: snapshot.data!.docs[index]['Image'],
                date: snapshot.data!.docs[index]['Date'],
                todo: snapshot.data!.docs[index]['Todo']
              ),
            )
          );
        },
      ),
    );
  }
}