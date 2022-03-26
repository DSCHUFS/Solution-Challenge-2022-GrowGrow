import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CampaignData.dart';
import 'CampaignUI.dart';


CampaignData campaignData = CampaignData();

class CampaignMain extends StatelessWidget {
    const CampaignMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campaign',
          style: TextStyle(
              color: Color(0xff615E5C),
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
      ),
      backgroundColor: Colors.white24,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.lightBlue,
          iconSize: 40,
          onPressed: (){},
        ),
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