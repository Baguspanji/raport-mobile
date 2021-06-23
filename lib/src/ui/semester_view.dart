import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/absensi_view.dart';
import 'package:raport/src/ui/pembayaran_view.dart';
import 'package:raport/src/ui/penilaian_view.dart';

class SemesterView extends StatefulWidget {
  final String dari;
  final String sampai;
  final String kelas;
  final int id_kelas;
  final String semester;
  const SemesterView({
    Key key,
    this.dari,
    this.sampai,
    this.kelas,
    this.id_kelas,
    this.semester,
  }) : super(key: key);

  @override
  _SemesterViewState createState() => _SemesterViewState();
}

class _SemesterViewState extends State<SemesterView> {
  int _currentIndex = 0;

  String _nama = '';
  String _alamat = '';
  String _user = '';
  String _image = '';

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

  Widget _selectedTab(i) {
    switch (i) {
      case 0:
        return AbsensiView(dari: widget.dari, sampai: widget.sampai);
        break;
      case 1:
        return NilaiView(
          dari: widget.dari,
          sampai: widget.sampai,
          id_kelas: widget.id_kelas,
        );
        break;
      case 2:
        return PembayaranView(
          dari: widget.dari,
          sampai: widget.sampai,
          id_kelas: widget.id_kelas,
          semester: widget.semester == 'Ganjil' ? 1 : 2,
        );
        break;
      default:
        return AbsensiView(dari: widget.dari, sampai: widget.sampai);
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_size.height * 0.06),
        child: AppBar(
          iconTheme: IconThemeData(color: colores.dark),
          backgroundColor: colores.info,
          elevation: 10,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              '${widget.kelas} - ${widget.semester}',
              style: styleText(
                24,
                colores.dark,
                FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: _size.height * 0.02),
            Container(
              width: _size.width * 0.9,
              height: _size.height * 0.14,
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: _size.height * 0.1,
                      height: _size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: Colors.white60, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 24,
                            offset: Offset(0, 10),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(_image),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: _size.height * 0.02),
            SizedBox(
              height: _size.height * 0.6,
              width: _size.width * 0.9,
              child: PageStorage(
                  child: _selectedTab(_currentIndex), bucket: bucket),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 4.0,
              spreadRadius: 8,
            )
          ],
        ),
        child: FloatingNavbar(
          onTap: (val) {
            _currentIndex = val;
            setState(() {});
          },
          currentIndex: _currentIndex,
          backgroundColor: colores.info,
          selectedBackgroundColor: colores.secondary,
          selectedItemColor: Colors.white,
          unselectedItemColor: colores.dark,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
          borderRadius: 12,
          iconSize: 30,
          items: [
            FloatingNavbarItem(icon: Icons.date_range_outlined, title: 'Absen'),
            FloatingNavbarItem(icon: Icons.bar_chart_outlined, title: 'Nilai'),
            FloatingNavbarItem(
                icon: Icons.attach_money_outlined, title: 'Bayar'),
          ],
        ),
      ),
    );
  }
}
