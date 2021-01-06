// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/models/yapilacaklar.dart';

import 'models/not_ekle.dart';

void main() => runApp(MyApp());

final Color darkBlue = Color.fromARGB(225, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue), //ekran rengini darkbulue yaptık
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List <To_do>yapilcak = [
    To_do.withId(1, "Kisa aciklama1", "yaptıgım seyler", false),
    To_do.withId(2, "Kisa aciklama2", "yapacagım seyler", true),
    To_do.withId(3, "Kisa aciklama3", "yapsam mı dediğim seyler", true)
  ];
  To_do secilTo_do = To_do.withId(0, "konu", "icerik", false);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ne Yapacağım HomePage"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: yapilcak.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(yapilcak[index].id.toString() +
                        ") " +
                        yapilcak[index].konu),
                    subtitle: Text(yapilcak[index].icerik),
                    leading: Icon(Icons.assignment_rounded
                        //CircleAvatar kullanılarak alttaki kodlar kullanılabilir
                        //backgroundImage: NetworkImage(
                        //  "https://cdn.lisaangel.co.uk/image/cache/data/product-images/aw18/bi-aw18/nanas-notes-a-five-notebook-4x3a7074-515x515.jpg"),
                        ),
                    trailing: buildIcon(yapilcak[index].durum),
                    onTap: () {
                      setState(() {
                        this.secilTo_do = yapilcak[index];
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        if (yapilcak[index].durum == true) {
                          yapilcak[index].durum = false;
                        } else {
                          yapilcak[index].durum = true;
                        }
                      });
                    });
              }),
        ),
        Text(secilTo_do.icerik),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 4.0,),
                    Text("Yeni Not"),
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> notekle(yapilcak)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 4.0,),
                    Text("Düzenle"),
                  ],
                ),
                onPressed: (){
                  Text("Not Ekle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 4.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed: (){
                  Text("Not Ekle");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildIcon(bool durum) {
    if (durum == true) {
      return Icon(Icons.done);
    } else if (durum == false) {
      return Icon(Icons.assistant_photo_outlined);
    }
  }
}
