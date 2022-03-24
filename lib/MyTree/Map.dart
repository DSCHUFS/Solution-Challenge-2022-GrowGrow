class Map {
  int UserNum = 0;
  int TreeNum = 0;
  String TreeLocation = '';
  DateTime TreeDate = DateTime(2022,03,13);
  double X = 0;
  double Y = 0;
  int Leading = 0;

  Map(int user_num, int tree_num, String loc, DateTime date, double x, double y, int leading){
    UserNum = user_num;
    TreeNum = tree_num;
    TreeLocation = loc;
    TreeDate = date;
    X = x;
    Y = y;
    Leading = leading;
  }
}