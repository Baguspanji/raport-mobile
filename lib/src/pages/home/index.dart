import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:raport/src/configs/constans_config.dart';
import 'package:raport/src/configs/constants_assets.dart';
import 'package:raport/src/controllers/auth_controller.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final con = Get.put(AuthController());

  List<Color> colorses = [kPrimaryColor, kDangerColor, kSuccessColor];

  bool loading = false;

  @override
  void initState() {
    super.initState();
    // _getKelas();
    _getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void _getKelas() {
  //   getIdUser().then((user) {
  //     getToken().then((token) {
  //       blocUsers.getKelas(user, token);
  //       blocUsers.getDetail(user, token);
  //     });
  //   });
  // }

  void _getUser() async {
    setState(() {
      loading = true;
    });
    String message = await con.getUser();
    Toast.show(message, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      loading = false;
    });
  }

  // void _signOut() {
  //   rmvToken();
  //   Navigator.pushReplacementNamed(context, '/login');
  // }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Material(
      // child: FancyDrawerWrapper(
      //   backgroundColor: colores.info,
      //   controller: _controller,
      //   drawerItems: <Widget>[
      //   Stack(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(top: _size.height * 0.09),
      //         padding: EdgeInsets.only(top: _size.height * 0.02, bottom: 10),
      //         height: _size.height * 0.3,
      //         width: _size.width * 0.5,
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(4),
      //         ),
      //         child: StreamBuilder(
      //           stream: blocUsers.resKelas,
      //           builder: (context, AsyncSnapshot<KelasModel> snapshot) {
      //             if (snapshot.hasData) {
      //               if (snapshot.data.status) {
      //                 return ListView.builder(
      //                   itemCount: snapshot.data.data.length,
      //                   itemBuilder: (context, i) {
      //                     return buildListKelas(snapshot, i, context);
      //                   },
      //                 );
      //               } else {
      //                 return Center(
      //                   child: Text('Tidak ada data'),
      //                 );
      //               }
      //             } else if (snapshot.hasError) {
      //               return Text(snapshot.error);
      //             } else {
      //               return Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             }
      //           },
      //         ),
      //       ),
      //       Container(
      //         width: _size.width * 0.3,
      //         height: _size.width * 0.3,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(200),
      //           border: Border.all(color: Colors.white60, width: 4),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.5),
      //               spreadRadius: 2,
      //               blurRadius: 16,
      //               offset: Offset(0, 10),
      //             ),
      //           ],
      //           image: DecorationImage(
      //             fit: BoxFit.cover,
      //             image: CachedNetworkImageProvider(_image),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   // Container(
      //   //   height: _size.height * 0.05,
      //   //   width: _size.width * 0.5,
      //   //   decoration: BoxDecoration(
      //   //     color: Colors.white,
      //   //     borderRadius: BorderRadius.circular(4),
      //   //   ),
      //   //   child: RaisedButton.icon(
      //   //     color: Colors.blueAccent,
      //   //     onPressed: () {},
      //   //     icon: Icon(
      //   //       Icons.lock_outline,
      //   //       color: Colors.white,
      //   //       size: 20,
      //   //     ),
      //   //     label: Text(
      //   //       'Ganti Pass',
      //   //       style: styleText(
      //   //         18,
      //   //         Colors.white,
      //   //         FontWeight.bold,
      //   //       ),
      //   //     ),
      //   //   ),
      //   // ),
      //   Container(
      //     height: _size.height * 0.05,
      //     width: _size.width * 0.5,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(4),
      //     ),
      //     child: RaisedButton.icon(
      //       color: Colors.redAccent,
      //       onPressed: _signOut,
      //       icon: Icon(
      //         Icons.power_settings_new_outlined,
      //         color: Colors.white,
      //         size: 20,
      //       ),
      //       label: Text(
      //         'Log Out',
      //         style: styleText(
      //           18,
      //           Colors.white,
      //           FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: _size.height * 0.26,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: _size.height * 0.18,
                      width: _size.width * 1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 6),
                            blurRadius: 4.0,
                          )
                        ],
                        image: DecorationImage(
                          image: ExactAssetImage(imageBg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: _size.height * 0.08),
                      height: _size.height * 0.16,
                      width: _size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: Obx(() {
                        var detail = con.userDetailData.value;
                        if (detail.nama == null) {
                          return Center(
                            child: Text('data kosong'),
                          );
                        }

                        if (loading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return GFListTile(
                          avatar: GFAvatar(
                            size: 60,
                            backgroundImage: NetworkImage(
                                '$globalApi/assets/images/siswa/7-Fasilitas-Sekolah-Kejuruan-Agar-Siswa-Siap-di-Era-Industri-4_0-1.jpg'),
                            shape: GFAvatarShape.standard,
                          ),
                          subTitle: Container(
                            padding: EdgeInsets.only(top: 10),
                            height: _size.height * 0.12,
                            width: _size.width * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detail.nis!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  detail.nama!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  detail.alamat!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            buildDataDetail(_size)
          ],
        ),
      ),
      // ),
    );
  }

  Widget buildDataDetail(Size _size) {
    return Expanded(
      child: Obx(() {
        var detail = con.userDetailData.value;
        if (loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (detail.nama != null) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                buildItemDetail(_size, 'NISN', (detail.nisn!)),
                // buildItemDetail(_size, 'Ttl',
                //     ('${detail.tempatLahir!}, ${Waktu(detail.tanggalLahir!).yMMMd()}')),
                buildItemDetail(_size, 'Jenis Kelamin', (detail.jenisKelamin!)),
                buildItemDetail(_size, 'Agama', (detail.agama!)),
                buildItemDetail(
                    _size, 'Status Keluarga', (detail.statusKeluarga!)),
                buildItemDetail(_size, 'Anak ke-', (detail.anakKe!)),
                buildItemDetail(_size, 'Tlp', (detail.telepon!)),
                buildItemDetail(_size, 'Sekolah Asal', (detail.sekolahAsal!)),
                buildItemDetail(_size, 'Nama Ayah', (detail.namaAyah!)),
                buildItemDetail(_size, 'Nama Ibu', (detail.namaIbu!)),
                buildItemDetail(_size, 'Alamat Ortu', (detail.alamatOrangtua!)),
                buildItemDetail(_size, 'Pekerjaan Ayah', (detail.kerjaAyah!)),
                buildItemDetail(_size, 'Pekerjaan Ibu', (detail.kerjaIbu!)),
                buildItemDetail(_size, 'Nama Wali', (detail.namaWali!)),
                buildItemDetail(_size, 'Alamat Wali', (detail.alamatWali!)),
                buildItemDetail(_size, 'Pekerjaan Wali', (detail.kerjaWali!)),
              ],
            );
          } else {
            return Center(
              child: Text('Tidak ada data'),
            );
          }
        }
      }),
    );
  }

  Container buildItemDetail(Size _size, String key, String value) {
    return Container(
      height: _size.height * 0.06,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: _size.width * 0.38,
            child: Text(key),
          ),
          Text(': '),
          SizedBox(
            width: _size.width * 0.4,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  // Theme buildListKelas(
  //     AsyncSnapshot<KelasModel> snapshot, int i, BuildContext context) {
  //   return Theme(
  //     data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
  //     child: ExpansionTile(
  //       title: Text(
  //         '${snapshot.data.data[i].namaKelas}',
  //         style: styleText(
  //           18,
  //           Colors.black,
  //           FontWeight.w600,
  //         ),
  //       ),
  //       children: [
  //         InkWell(
  //           child: Container(
  //             margin: EdgeInsets.only(left: 20),
  //             alignment: Alignment.centerLeft,
  //             child: Row(
  //               children: [
  //                 Icon(
  //                   Icons.keyboard_arrow_right,
  //                   color: colores.info,
  //                 ),
  //                 Text(
  //                   'Ganjil',
  //                   style: styleText(
  //                     14,
  //                     colores.secondary,
  //                     FontWeight.w600,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => SemesterView(
  //                   dari: snapshot.data.data[i].ganjilDari,
  //                   sampai: snapshot.data.data[i].ganjilSampai,
  //                   kelas: snapshot.data.data[i].namaKelas,
  //                   semester: 'Ganjil',
  //                   id_kelas: int.parse(snapshot.data.data[i].idKelas),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //         SizedBox(height: 20),
  //         InkWell(
  //           child: Container(
  //             margin: EdgeInsets.only(left: 20),
  //             alignment: Alignment.centerLeft,
  //             child: Row(
  //               children: [
  //                 Icon(
  //                   Icons.keyboard_arrow_right,
  //                   color: colores.info,
  //                 ),
  //                 Text(
  //                   'Genap',
  //                   style: styleText(
  //                     14,
  //                     colores.secondary,
  //                     FontWeight.w600,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => SemesterView(
  //                   dari: snapshot.data.data[i].genapDari,
  //                   sampai: snapshot.data.data[i].genapSampai,
  //                   kelas: snapshot.data.data[i].namaKelas,
  //                   semester: 'Genap',
  //                   id_kelas: int.parse(snapshot.data.data[i].idKelas),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
