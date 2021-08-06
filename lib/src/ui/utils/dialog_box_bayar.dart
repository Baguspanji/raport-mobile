import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/nilaiModel.dart';

class DialogBox extends StatefulWidget {
  final String title;
  final DateTime tanggal;

  const DialogBox({Key key, this.title, this.tanggal}) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: _size.width * 0.9,
        height: _size.height * 0.12,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(0, 4),
                blurRadius: 14,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18),
            Text(
              '${Waktu(widget.tanggal).yMMMMEEEEd()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: styleText(
                13,
                Colors.black,
                FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
