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
      body:ListView.builder(
        itemCount: campaignData.getCampaignNum(),
        itemBuilder: (BuildContext context, int index) => CampaignUI(
          campaigntitle: campaignData.getCampaignTitle(index),
          like: campaignData.getLike(index),
          scrap: campaignData.getScrap(index),
          info: campaignData.getInfo(index),
        ),
      )
    );
  }
}