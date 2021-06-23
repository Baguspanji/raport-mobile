import 'package:flutter/material.dart';
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/absenModel.dart';
import 'package:raport/src/shared/preference.dart';

class AbsensiView extends StatefulWidget {
  final String dari;
  final String sampai;
  const AbsensiView({Key key, this.dari, this.sampai}) : super(key: key);

  @override
  _AbsensiViewState createState() => _AbsensiViewState();
}

class _AbsensiViewState extends State<AbsensiView> {
  int alpha = 0;
  int izin = 0;
  int sakit = 0;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildContainer(
                      _size, 'Alpa', '${snapshot.data.data.alpha}', Colors.red),
                  buildContainer(
                      _size, 'Izin', '${snapshot.data.data.izin}', Colors.blue),
                  buildContainer(_size, 'Sakit', '${snapshot.data.data.sakit}',
                      Colors.green),
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

  Container buildContainer(
      Size _size, String nama, String jumlah, Color warna) {
    return Container(
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
    );
  }
}
