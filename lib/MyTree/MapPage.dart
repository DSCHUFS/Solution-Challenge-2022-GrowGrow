import 'package:firebase_database/firebase_database.dart';

class MapPage{
  String? key;
  int UserNum;
  int TreeNum;
  String TreeLocation;
  DateTime TreeDate;
  double X;
  double Y;
  int Leading;

  MapPage(this.UserNum, this.TreeNum,this.TreeLocation, this.TreeDate, this.X, this.Y, this.Leading);

  MapPage.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        UserNum = snapshot.value['UserNum'],
        TreeNum = snapshot.value['TreeNum'],
        TreeLocation = snapshot.value['TreeLocation'],
        TreeDate = snapshot.value['TreeDate'],
        X = snapshot.value['X'],
        Y = snapshot.value['Y'],
        Leading = snapshot.value['Leading'];

  toJson() {
    return{
      'UserNum': UserNum,
      'TreeNum': TreeNum,
      'TreeLocation' : TreeLocation,
      'TreeDate' : TreeDate,
      'X' : X,
      'Y' : Y,
      'Leading' : Leading,
    };
  }

}