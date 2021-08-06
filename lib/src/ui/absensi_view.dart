import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/absenModel.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/utils/dialog_box_absen.dart';

import '../models/absenModel.dart';

class AbsensiView extends StatefulWidget {
  final String dari;
  final String sampai;
  const AbsensiView({Key key, this.dari, this.sampai}) : super(key: key);

  @override
  _AbsensiViewState createState() => _AbsensiViewState();
}

class _AbsensiViewState extends State<AbsensiView> {
  void _getAbsen() {
    getIdUser().then((user) {
      getToken().then((token) {
        // print(widget.dari);
        // print(widget.sampai);
        blocUsers.getAbsen(user, token, widget.dari, widget.sampai);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAbsen();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: blocUsers.resAbsen,
        builder: (context, AsyncSnapshot<AbsenModel> snapshot) {
          if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: ListView(
                children: [
                  buildContainer(
                      _size,
                      'Alpa',
                      '${snapshot.data.data.alpha.count}',
                      Colors.red,
                      snapshot.data.data.alpha.detail),
                  buildContainer(
                      _size,
                      'Izin',
                      '${snapshot.data.data.izin.count}',
                      Colors.blue,
                      snapshot.data.data.izin.detail),
                  buildContainer(
                      _size,
                      'Sakit',
                      '${snapshot.data.data.sakit.count}',
                      Colors.green,
                      snapshot.data.data.sakit.detail),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: _size.height * 0.5,
                    width: _size.width * 0.9,
                    child: Column(
                      children: [
                        Text(
                          'Detail Masuk',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 18),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.data.masuk.detail.length,
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
                                    '${Waktu(snapshot.data.data.masuk.detail[i].tanggal).yMMMMEEEEd()}',
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  InkWell buildContainer(Size _size, String nama, String jumlah, Color warna,
      List<Detail> detail) {
    return InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogBox(
              title: nama,
              detail: detail,
            );
          }),
      child: Container(
        height: _size.height * 0.16,
        width: _size.width * 0.9,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: warna,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: _size.width * 0.3,
              child: Text(
                '$nama',
                style: styleText(
                  40,
                  Colors.white,
                  FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: _size.width * 0.18,
              height: _size.width * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$jumlah',
                style: styleText(
                  40,
                  warna,
                  FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
