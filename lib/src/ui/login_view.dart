import 'package:flutter/material.dart';
import 'package:raport/src/controllers/usersBloc.dart';
import 'package:raport/src/helper/uiColor.dart';
import 'package:raport/src/helper/uiHelper.dart';
import 'package:raport/src/models/syaratModel.dart';
import 'package:raport/src/shared/preference.dart';
import 'package:raport/src/ui/utils/dialog_box_a.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isTrue = false;
  bool _validate = false;
  bool _isShow = true;

  void _getLogin() {
    Toast.show('Loading..', context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    if (username.text == "" || password.text == "") {
      Toast.show('Tidak boleh kosong!', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      _isTrue = false;
      _validate = true;
    } else {
      blocUsers.login(username.text, password.text, "");
      blocUsers.resLogin.listen((value) {
        if (value.status == true) {
          setToken(value.data.jwtToken);
          setNama(value.data.nama);
          setIdUser(value.data.username);
          setAlamat(value.data.alamat);
          setTtl(value.data.tempatLahir + ', ');
          setImg(value.data.image);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          _validate = false;
          _isTrue = true;
          Toast.show('Username atau Password salah!', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        }
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    blocUsers.getSyarat();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colores.info,
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: _size.height * 0.1),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: ExactAssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.01),
                Container(
                  alignment: Alignment.centerRight,
                  height: 40,
                  width: _size.width * 0.8,
                  child: _validate
                      ? Container(
                          height: 30,
                          width: 240,
                          margin: EdgeInsets.only(right: 14),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.amber.shade300,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Text(
                            'form tidak boleh kosong',
                            style: styleText(
                              14,
                              colores.dark,
                              FontWeight.bold,
                            ),
                          ),
                        )
                      : _isTrue
                          ? Container(
                              height: 30,
                              width: 240,
                              margin: EdgeInsets.only(right: 14),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade300,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Text(
                                'Username atau Password salah',
                                style: styleText(
                                  12,
                                  colores.dark,
                                  FontWeight.bold,
                                ),
                              ),
                            )
                          : null,
                ),
                SizedBox(height: _size.height * 0.01),
                Container(
                  height: _size.height * 0.06,
                  width: _size.width * 0.8,
                  child: TextField(
                    controller: username,
                    style: styleText(14, colores.dark, FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.01),
                Container(
                  height: _size.height * 0.06,
                  width: _size.width * 0.8,
                  child: TextField(
                    obscureText: _isShow,
                    controller: password,
                    style: styleText(14, colores.dark, FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      icon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _isShow = !_isShow;
                          setState(() {});
                        },
                        icon: Icon(
                          _isShow
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined,
                          color: colores.dark,
                        ),
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.02),
                Container(
                  alignment: Alignment.centerRight,
                  height: _size.height * 0.06,
                  width: _size.width * 0.8,
                  child: InkWell(
                    onTap: _getLogin,
                    child: Container(
                      height: _size.height * 0.06,
                      width: _size.width * 0.7,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(6, 6),
                          )
                        ],
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(40.0)), // set rounded corner radius
                      ),
                      child: Text(
                        'Sign In',
                        style: styleText(
                          22,
                          Colors.white,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              bottom: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: StreamBuilder(
                    stream: blocUsers.resSyarat,
                    builder: (context, AsyncSnapshot<SyaratModel> snapshot) {
                      if (snapshot.hasData) {
                        return InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogBox(
                                  title: 'Syarat & Ketentuan',
                                  ketentuan: snapshot.data.data,
                                );
                              }),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Syarat & Ketentuan',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
