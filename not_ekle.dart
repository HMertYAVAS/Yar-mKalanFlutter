import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/yapilacaklar.dart';

class notekle extends StatefulWidget{
  List<To_do> yapilcak;
  //notekle(List<To_do>yapilcak){
  //this.yapilcak=yapilcak
  notekle(this.yapilcak);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _notekleState();
  }

}

class _notekleState extends State<notekle>{
  var FormKey= GlobalKey<FormState>();
  var yapilacaklar= To_do("","",false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Not")),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: Form(
          key: FormKey,
        child: Column(
          children: <Widget>[
            buildkonu(),
            buildicerik(),
            buildSubmit()
          ],
        ),
        ),
      ),
    );
  }

  buildkonu() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Konu",hintText: "Kısa hatırlatma gir") ,
      onSaved: (String value){
        yapilacaklar.konu=value;
      },
    );
  }

  buildicerik() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Not",hintText: "Tüm notu girebilirsin") ,
      onSaved: (String value){
        yapilacaklar.icerik=value;
      },
    );
  }

  Widget buildSubmit(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        FormKey.currentState.save();
        widget.yapilcak.add(yapilacaklar);
        Navigator.pop(context);
      },
    );
  }

}