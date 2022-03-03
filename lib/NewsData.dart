import 'News.dart';

class NewsData{
  List<News> NewsDB = [
    News(1,'1 Title','1 Sub', DateTime(2000,07,17,1,0,0,0,0), '1 Writer','','','1 tag1','1 tag2'),
    News(2,'2 Title','2 Sub', DateTime(2000,07,17,2,0,0,0,0), '2 Writer','','','21','22'),
    News(3,'3 Title','3 Sub', DateTime(2000,07,17,1,0,0,0,0), '3 Writer','','','31','32'),
    News(4,'4 Title','4 Sub', DateTime(2000,07,17,2,0,0,0,0), '4 Writer','','','41','42'),
    News(5,'5 Title','5 Sub', DateTime(2000,07,17,1,0,0,0,0), '5 Writer','','','51','52'),
    News(6,'6 Title','6 Sub', DateTime(2000,07,17,2,0,0,0,0), '6 Writer','','','61','62'),
  ];

  List getList(){
    List<int> test = [0,1,2,3];
    return test;
  }

  int getNum(){
    return NewsDB.length;
  }

  String getTitle(int index){
    return NewsDB[index].NewsTitle;
  }

  String getSubtitle(int index){
    return NewsDB[index].NewsSubtitle;
  }

  String getWriter(int index){
    return NewsDB[index].NewsWriter;
  }

  DateTime getTime(int index){
    return NewsDB[index].NewsTime;
  }

  String getTag1(int index){
    return NewsDB[index].NewsTag1;
  }

  String getTag2(int index){
    return NewsDB[index].NewsTag2;
  }

}