import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:like_button/like_button.dart';
import 'CampaignInfo.dart';
import 'package:like_button/like_button.dart';
//import 'package:flutter_button/flutter_button.dart';


class CampaignUI extends StatelessWidget {
  const CampaignUI({
    Key? key,
    required this.campaigntitle,
    required this.like,
    required this.scrap,
    required this.info,
    this.onPressed,
  }) : super(key: key);

  final String campaigntitle;
  final String like;
  final String scrap;
  final String info;
  final Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/grandcanyon.jpg'),
            fit: BoxFit.none,
          ),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Color(0xff41B06B),
          ),
        ),

      child: Stack(
          children: <Widget>[
            Container( //scrap button
              margin: const EdgeInsets.fromLTRB(370, 185, 0, 0),
              child: Expanded(
                child: LikeButton(
                  size: 35,
                  circleColor: const CircleColor(end: Colors.redAccent, start: Colors.red),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.red
                  ),
                  likeBuilder: (bool isLiked){
                    return Icon(
                        Icons.favorite_rounded,
                        color: isLiked? Colors.red : Colors.grey,
                        size: 34
                    );
                  },
                ),
              ),
            ),

            Container( //scrap button
              margin: const EdgeInsets.fromLTRB(440, 178, 0, 0),
              child: Expanded(
                child: LikeButton(
                  size: 35,
                  circleColor: const CircleColor(start: Colors.yellow, end: Colors.yellowAccent),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.yellow,
                    dotSecondaryColor: Colors.yellow
                  ),
                  likeBuilder: (bool isLiked){
                    return Icon(
                      Icons.star_rounded,
                      color: isLiked? Colors.yellow : Colors.grey,
                      size: 40
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0,0,0,0),
              height: 50,
              width: 550,
              child: TextButton(
                style: TextButton.styleFrom(
                primary: Colors.black26,
                side: BorderSide(
                  color: Colors.transparent,
              ),
              ),
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampaignInfo(
                        campaigntitle: campaigntitle,
                        like: like,
                        scrap: scrap,
                        info: info,
                        campaigndate: 'MM/DD ~ MM/DD',
                        )
                  ),
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  width: 550,
                  height: 40,
                  child: Text(campaigntitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                     ),
                  ),

                          ]
                      ),
                    ),
                            ),
                         ]
                          ),
                        ),
    );





  }
}