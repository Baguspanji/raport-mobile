import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/nilaiModel.dart';

class DialogBox extends StatefulWidget {
  final String title;
  final List<Jeni> jenis;

  const DialogBox({Key key, this.title, this.jenis}) : super(key: key);

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
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 18),
            Container(
              height: _size.height * 0.4 - 88,
              child: ListView.builder(
                itemCount: widget.jenis.length,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        width: _size.width * 0.3,
                        height: _size.height * 0.05,
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2),
                        ),
                        child: Text(
                          '${widget.jenis[i].jenis}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: styleText(
                            13,
                            Colors.black,
                            FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: _size.width * 0.36,
                        height: _size.height * 0.05,
                        margin: EdgeInsets.only(left: 6),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.jenis[i].nilai.length,
                          itemBuilder: (context, id) {
                            return Container(
                              margin: EdgeInsets.only(right: 6),
                              width: _size.width * 0.1,
                              height: _size.height * 0.04,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2,
                                    color: double.parse(widget
                                                .jenis[i].nilai[id].nilai) <
                                            widget.jenis[i].nilaiRata
                                        ? Colors.redAccent
                                        : Colors.greenAccent),
                              ),
                              child: Text(
                                '${widget.jenis[i].nilai[id].nilai}',
                                style: styleText(
                                  14,
                                  Colors.black,
                                  FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
