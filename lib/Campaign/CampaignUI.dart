import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CampaignInfo.dart';
import 'package:like_button/like_button.dart';

class CampaignUI extends StatelessWidget {
  const CampaignUI({
    Key? key,
    required this.campaigntitle,
    required this.like,
    required this.scrap,
    required this.info,
    required this.image,
    required this.date,
    required this.todo,
    this.onPressed,
  }) : super(key: key);

  final String campaigntitle;
  final int like;
  final int scrap;
  final String info;
  final String image;
  final String date;
  final Function()? onPressed;
  final String todo;

  ImageProvider<Object> imagecheck(){
    if (image == 'null')
      return  AssetImage('grandcanyon.jpg');
    else
      return NetworkImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //alignment: Alignment.centerLeft,
          primary: Colors.white,
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CampaignInfo(
                  campaigntitle: campaigntitle,
                  like: like,
                  scrap: scrap,
                  info: info,
                  campaigndate: date,
                  cpimage: image,
                  todo: todo,
                )
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imagecheck(),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Color(0xff41B06B),
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                    },
                    child: Stack(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                            width: 10000,
                            height: 50,
                            child: Text(campaigntitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      children: <Widget> [
                        Container( //like button
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Expanded(
                            child: LikeButton(
                              size: 34,
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
                          margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
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

                        Container( //scrap button
                          margin: const EdgeInsets.fromLTRB(3 , 0, 2, 0),
                          child: Expanded(
                            child: LikeButton(
                              size: 33,
                              circleColor: const CircleColor(start: Colors.green, end: Colors.greenAccent),
                              bubblesColor: const BubblesColor(
                                  dotPrimaryColor: Colors.green,
                                  dotSecondaryColor: Colors.green
                              ),
                              likeBuilder: (bool isLiked){
                                return Icon(
                                    Icons.volunteer_activism,
                                    color: isLiked? Colors.green : Colors.grey,
                                    size: 33
                                );
                              },
                            ),
                          ),
                        ),
                      ]
                  ),
                )
              ]

          ),
        ),
      ),
    );
  }
}