import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/nilaiModel.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/utils/dialog_box.dart';

class NilaiView extends StatefulWidget {
  final String dari;
  final String sampai;
  final int id_kelas;
  const NilaiView({Key key, this.dari, this.sampai, this.id_kelas})
      : super(key: key);

  @override
  _NilaiViewState createState() => _NilaiViewState();
}

class _NilaiViewState extends State<NilaiView> {
  void _getNilai() {
    getIdUser().then((user) {
      getToken().then((token) {
        // print(widget.dari);
        // print(widget.sampai);
        blocUsers.getNilai(
            user, token, widget.dari, widget.sampai, widget.id_kelas);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getNilai();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: blocUsers.resNilai,
      builder: (context, AsyncSnapshot<NilaiModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.status) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogBox(
                          title: '${snapshot.data.data[i].pelajaran}',
                          jenis: snapshot.data.data[i].jenis,
                        );
                      }),
                  child: Container(
                    width: _size.width * 0.9,
                    height: _size.height * 0.1,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 4,
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${snapshot.data.data[i].pelajaran}',
                      overflow: TextOverflow.ellipsis,
                      style: styleText(
                        28,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Tidak ada data'),
            );
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
