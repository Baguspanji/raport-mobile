import 'package:flutter/material.dart';
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/bayarModel.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/utils/dialog_box_bayar.dart';

class PembayaranView extends StatefulWidget {
  final String dari;
  final String sampai;
  final int id_kelas;
  final int semester;
  const PembayaranView({
    Key key,
    this.dari,
    this.sampai,
    this.id_kelas,
    this.semester,
  }) : super(key: key);

  @override
  _PembayaranViewState createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  void _getBayar() {
    getIdUser().then((user) {
      getToken().then((token) {
        // print(widget.dari);
        // print(widget.sampai);
        blocUsers.getBayar(user, token, widget.dari, widget.sampai,
            widget.id_kelas, widget.semester);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getBayar();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: blocUsers.resBayar,
        builder: (context, AsyncSnapshot<BayarModel> snapshot) {
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
                            title: 'Detail Pembayaran',
                            tanggal: snapshot.data.data[i].tanggal,
                          );
                        }),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: snapshot.data.data[i] == 0 ? 0 : 20),
                      height: _size.height * 0.12,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          width: 4,
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: _size.width * 0.68,
                            child: Text(
                              '${snapshot.data.data[i].bayar}',
                              overflow: TextOverflow.clip,
                              style: styleText(
                                24,
                                colores.dark,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                          snapshot.data.data[i].status == 1
                              ? Column(
                                  children: [
                                    Icon(
                                      Icons.check_box_outlined,
                                      size: 40,
                                      color: colores.success,
                                    ),
                                    Text('Lunas')
                                  ],
                                )
                              : Column(
                                  children: [
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      size: 40,
                                      color: colores.danger,
                                    ),
                                    Text('Belum')
                                  ],
                                )
                        ],
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
        });
  }
}
