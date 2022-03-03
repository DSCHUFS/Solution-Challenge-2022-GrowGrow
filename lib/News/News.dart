class News {
  int NewsNum = 0;
  String NewsTitle = '';
  String NewsSubtitle = '';
  DateTime NewsTime = DateTime(2000,07,17,0,0,0,0,0);
  String NewsWriter = '';
  String NewsImage = '';
  String NewsReport = '';
  String NewsTag1 = '';
  String NewsTag2 = '';

  News(int num, String title, String sub, DateTime time, String writer, String image, String report, String tag1, String tag2){
    NewsNum = num;
    NewsTitle = title;
    NewsSubtitle = sub;
    NewsTime = time;
    NewsWriter = writer;
    NewsImage = image;
    NewsReport = report;
    NewsTag1 = tag1;
    NewsTag2 = tag2;
  }
}
