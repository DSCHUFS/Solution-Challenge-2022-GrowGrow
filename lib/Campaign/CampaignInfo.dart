import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CampaignInfo extends StatelessWidget {
  const CampaignInfo({
    Key? key,
    required this.campaigntitle,
    required this.like,
    required this.scrap,
    required this.info,
    required this.campaigndate,
  }) : super(key: key);

  final String campaigntitle;
  final String like;
  final String scrap;
  final String info;
  final String campaigndate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Color(0xff615E5C),
          ),
          title: const Text(
            'Campaign',
            style: TextStyle(
                color: Color(0xff615E5C),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0xff81dfa4),
                width: 3,
              ),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 260,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/grandcanyon.jpg'),
                        fit: BoxFit.fitWidth,
                    ),
                    ),
                  ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              campaigntitle,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                    ]
                        )
                      ),
                    Padding(padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            'Info.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                             campaigndate,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                     padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                          Text(
                          info,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                          )
                            ],
                      )
                    )
                          ]),
                        ),
                      )
    );


  }

}