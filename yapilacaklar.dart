class To_do{
  int id;
  String konu;
  String icerik;
  bool durum;

  To_do(String konu,String icerik,bool durum){
    this.konu=konu;
    this.icerik=icerik;
    this.durum=durum;
  }

  //named constructer
  To_do.withId(int id,String konu,String icerik,bool durum){
    this.id=id;
    this.konu=konu;
    this.icerik=icerik;
    this.durum=durum;
  }
}