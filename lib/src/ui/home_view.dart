import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/detailModel.dart';
import 'package:raport/src/models/kelasModel.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/semester_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Color> colorses = [colores.primary, colores.danger, colores.success];

  String _nama = '';
  String _alamat = '';
  String _user = '';
  String _image = '';

  @override
  void initState() {
    super.initState();
    _getKelas();
    _getUser();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {}); // Must call setState
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: colores.info,
        controller: _controller,
        drawerItems: <Widget>[
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: _size.height * 0.09),
                padding: EdgeInsets.only(top: _size.height * 0.02, bottom: 10),
                height: _size.height * 0.3,
                width: _size.width * 0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: StreamBuilder(
                  stream: blocUsers.resKelas,
                  builder: (context, AsyncSnapshot<KelasModel> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.status) {
                        return ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, i) {
                            return buildListKelas(snapshot, i, context);
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
                ),
              ),
              Container(
                width: _size.width * 0.3,
                height: _size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: Colors.white60, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 16,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(_image),
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   height: _size.height * 0.05,
          //   width: _size.width * 0.5,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   child: RaisedButton.icon(
          //     color: Colors.blueAccent,
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.lock_outline,
          //       color: Colors.white,
          //       size: 20,
          //     ),
          //     label: Text(
          //       'Ganti Pass',
          //       style: styleText(
          //         18,
          //         Colors.white,
          //         FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            height: _size.height * 0.05,
            width: _size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: RaisedButton.icon(
              color: Colors.redAccent,
              onPressed: _signOut,
              icon: Icon(
                Icons.power_settings_new_outlined,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Log Out',
                style: styleText(
                  18,
                  Colors.white,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: buildMainHome(_size),
        ),
      ),
    );
  }

  Container buildMainHome(Size _size) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: _size.height * 0.4,
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
                image: ExactAssetImage('assets/images/bg-a.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: _size.height * 0.2),
            child: Container(
              height: _size.height * 0.3,
              width: _size.width * 0.9,
              padding: EdgeInsets.only(
                top: _size.height * 0.17,
                bottom: _size.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 24,
                    offset: Offset(0, 30), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _nama,
                    style: styleText(
                      _size.width * 0.06,
                      Colors.black87,
                      FontWeight.bold,
                    ),
                  ),
                  Text(
                    _alamat,
                    style: styleText(
                      _size.width * 0.05,
                      Colors.black,
                      FontWeight.w400,
                    ),
                  ),
                  Text(
                    _user,
                    style: styleText(
                      _size.width * 0.04,
                      Colors.black,
                      FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: _size.height * (0.1)),
            child: Container(
              height: _size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: _size.width * 0.5,
                    height: _size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.white60, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 24,
                          offset: Offset(0, 16),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(_image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _size.height * 0.09),
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: WaterDropMaterialHeader(
                backgroundColor: colores.info,
                color: colores.dark,
                distance: 40,
                offset: 20,
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: buildDataDetail(_size),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: _size.height * 0.14,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
              ),
              child: IconButton(
                iconSize: 30,
                color: colores.dark,
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  _controller.toggle();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDataDetail(Size _size) {
    return Container(
      padding: EdgeInsets.only(top: _size.height * 0.4, left: 30, right: 30),
      child: StreamBuilder(
        stream: blocUsers.resDetail,
        builder: (context, AsyncSnapshot<DetailModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.status) {
              return ListView(
                children: [
                  buildItemDetail(_size, 'NISN', (snapshot.data.data.nisn)),
                  buildItemDetail(_size, 'Ttl',
                      ('${snapshot.data.data.tempatLahir}, ${Waktu(snapshot.data.data.tanggalLahir).yMMMd()}')),
                  buildItemDetail(_size, 'Jenis Kelamin',
                      (snapshot.data.data.jenisKelamin)),
                  buildItemDetail(_size, 'Agama', (snapshot.data.data.agama)),
                  buildItemDetail(_size, 'Status Keluarga',
                      (snapshot.data.data.statusKeluarga)),
                  buildItemDetail(
                      _size, 'Anak ke-', (snapshot.data.data.anakKe)),
                  buildItemDetail(_size, 'Tlp', (snapshot.data.data.telepon)),
                  buildItemDetail(
                      _size, 'Sekolah Asal', (snapshot.data.data.sekolahAsal)),
                  buildItemDetail(
                      _size, 'Nama Ayah', (snapshot.data.data.namaAyah)),
                  buildItemDetail(
                      _size, 'Nama Ibu', (snapshot.data.data.namaIbu)),
                  buildItemDetail(_size, 'Alamat Ortu',
                      (snapshot.data.data.alamatOrangtua)),
                  buildItemDetail(
                      _size, 'Pekerjaan Ayah', (snapshot.data.data.kerjaAyah)),
                  buildItemDetail(
                      _size, 'Pekerjaan Ibu', (snapshot.data.data.kerjaIbu)),
                  buildItemDetail(
                      _size, 'Nama Wali', (snapshot.data.data.namaWali)),
                  buildItemDetail(
                      _size, 'Alamat Wali', (snapshot.data.data.alamatWali)),
                  buildItemDetail(
                      _size, 'Pekerjaan Wali', (snapshot.data.data.kerjaWali)),
                ],
              );
            } else {
              return Center(
                child: Text('Tidak ada data'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Container buildItemDetail(Size _size, String key, String value) {
    return Container(
      height: _size.height * 0.06,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(value),
        ],
      ),
    );
  }

  Theme buildListKelas(
      AsyncSnapshot<KelasModel> snapshot, int i, BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          '${snapshot.data.data[i].namaKelas}',
          style: styleText(
            18,
            Colors.black,
            FontWeight.w600,
          ),
        ),
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: colores.info,
                  ),
                  Text(
                    'Ganjil',
                    style: styleText(
                      14,
                      colores.secondary,
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SemesterView(
                    dari: snapshot.data.data[i].ganjilDari,
                    sampai: snapshot.data.data[i].ganjilSampai,
                    kelas: snapshot.data.data[i].namaKelas,
                    semester: 'Ganjil',
                    id_kelas: int.parse(snapshot.data.data[i].idKelas),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: colores.info,
                  ),
                  Text(
                    'Genap',
                    style: styleText(
                      14,
                      colores.secondary,
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SemesterView(
                    dari: snapshot.data.data[i].genapDari,
                    sampai: snapshot.data.data[i].genapSampai,
                    kelas: snapshot.data.data[i].namaKelas,
                    semester: 'Genap',
                    id_kelas: int.parse(snapshot.data.data[i].idKelas),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    setState(() {});
    _refreshController.loadComplete();
  }

  void _getKelas() {
    getIdUser().then((user) {
      getToken().then((token) {
        blocUsers.getKelas(user, token);
        blocUsers.getDetail(user, token);
      });
    });
  }

  void _getUser() {
    getIdUser().then((user) {
      getNama().then((nama) {
        getAlamat().then((alamat) {
          getImg().then((img) {
            _user = user;
            _nama = nama;
            _alamat = alamat;
            _image = 'https://sekolah.sukorejo.info/assets/images/siswa/' + img;
            setState(() {});
          });
        });
      });
    });
  }

  void _signOut() {
    rmvIdUser();
    rmvNama();
    rmvToken();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
