import 'Map.dart';

class MapData{
  List<Map> MapDB = [
    Map(1,1,'Seoul,Korea', DateTime(2022,03,13),37.566,126.97,0),
    Map(2,2,'Daejeon,Korea', DateTime(2022,03,13),126.97,126.97,1),
  ];

  int getNum(){
    return MapDB.length;
  }

  int getUserNum(int index){
    return MapDB[index].UserNum;
  }

  int getTreeNum(int index){
    return MapDB[index].TreeNum;
  }

  String getTreeLocation(int index){
    return MapDB[index].TreeLocation;
  }

  DateTime getTreeDate(int index){
    return MapDB[index].TreeDate;
  }

  double getX(int index){
    return MapDB[index].X;
  }

  double getY(int index){
    return MapDB[index].Y;
  }

  int getLeading(int index){
    return MapDB[index].Leading;
  }

}