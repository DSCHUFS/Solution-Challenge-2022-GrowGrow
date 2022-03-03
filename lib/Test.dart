class Test{
  int NewsNum = 0;
  int type = 0;
  String Question = '';
  String Answer = '';
  int Point = 0;
  bool GetPoint = false;

  Test(int n, int t, String q, String a, int p, bool g){
    NewsNum = n;
    type = t;
    Question = q;
    Answer = a;
    Point = p;
    GetPoint = g;
  }
}