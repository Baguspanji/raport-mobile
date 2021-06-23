import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:raport/src/models/syaratModel.dart';

class DialogBox extends StatefulWidget {
  final String title;
  final List<Data> ketentuan;

  const DialogBox({Key key, this.title, this.ketentuan}) : super(key: key);

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
        height: _size.height * 0.6,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18),
            Container(
              width: _size.width * 0.8,
              height: _size.height * 0.5,
              child: ListView.builder(
                itemCount: widget.ketentuan.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Text('${i + 1}. '),
                        Flexible(
                          child: Text('${widget.ketentuan[i].ketentuan}'),
                        ),
                      ],
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
