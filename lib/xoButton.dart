import 'package:flutter/material.dart';

typedef OnPlayerClickCallBack  = void Function (int);

class xoButton extends StatelessWidget {

  String text ;
  OnPlayerClickCallBack onPlayerClickCallBack ;
  int pos;
  xoButton (this.text , {required this.onPlayerClickCallBack , required this.pos}){}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                onPlayerClickCallBack(pos);
              },
              child: Text(
                text,
                style: TextStyle(fontSize: 70 , color: Colors.blue),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  side: BorderSide(color: Colors.blue ,width: 3),
                shadowColor: Colors.blue,
                elevation: 50,
              ),
            )));
  }
}
