import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/nilaiModel.dart';
import 'package:raport/src/models/absenModel.dart';

class DialogBox extends StatefulWidget {
  final String title;
  final List<Detail> detail;

  const DialogBox({Key key, this.title, this.detail}) : super(key: key);

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
        height: _size.height * 0.4,
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
              'Detail ${widget.title}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18),
            Container(
              height: _size.height * 0.4 - 88,
              child: ListView.builder(
                itemCount: widget.detail.length,
                itemBuilder: (context, i) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      width: _size.width * 0.5,
                      height: _size.height * 0.03,
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      child: Text(
                        '${Waktu(widget.detail[i].tanggal).yMMMMEEEEd()}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: styleText(
                          13,
                          Colors.black,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
