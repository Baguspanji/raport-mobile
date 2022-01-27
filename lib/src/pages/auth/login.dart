import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raport/src/configs/constans_config.dart';
import 'package:raport/src/configs/constants_assets.dart';
import 'package:raport/src/controllers/auth_controller.dart';
import 'package:raport/src/pages/home/index.dart';
import 'package:raport/src/repository/s_preference.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final con = Get.put(AuthController());

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _validate = false;
  bool _isShow = true;

  void _getLogin() async {
    setState(() {
      _validate = false;
    });
    Toast.show('Loading..', context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    if (username.text == "" || password.text == "") {
      setState(() {
        _validate = true;
      });
      Toast.show('Tidak boleh kosong!', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      String message =
          await con.authentication(user: username.text, pass: password.text);

      Toast.show(
        message,
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
      );

      if (con.authData.value.jwtToken != '') {
        setToken(con.authData.value.jwtToken!);
        setUsername(con.authData.value.username!);

        Get.toNamed(HomePage.routeName);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // blocUsers.getSyarat();
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
      backgroundColor: kInfoColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: _size.height * 0.1),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: ExactAssetImage(logo),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.01),
                Container(
                  alignment: Alignment.centerRight,
                  height: 40,
                  width: _size.width * 0.8,
                  child: Visibility(
                    visible: _validate,
                    child: Container(
                      height: 30,
                      width: _size.width * 0.7,
                      margin: EdgeInsets.only(right: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Text(
                        'form tidak boleh kosong',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.01),
                Container(
                  height: _size.height * 0.06,
                  width: _size.width * 0.8,
                  child: TextField(
                    controller: username,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isShow = !_isShow;
                          });
                        },
                        icon: Icon(
                          _isShow
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                      hintText: 'Password',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: _getLogin,
                  child: Container(
                    height: _size.height * 0.05,
                    width: _size.width * 0.8,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _size.height * 0.02)
              ],
            ),
            // Positioned.fill(
            //   bottom: 1,
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: StreamBuilder(
            //         stream: blocUsers.resSyarat,
            //         builder: (context, AsyncSnapshot<SyaratModel> snapshot) {
            //           if (snapshot.hasData) {
            //             return InkWell(
            //               onTap: () => showDialog(
            //                   context: context,
            //                   builder: (BuildContext context) {
            //                     return DialogBox(
            //                       title: 'Syarat & Ketentuan',
            //                       ketentuan: snapshot.data.data,
            //                     );
            //                   }),
            //               child: Container(
            //                 margin: EdgeInsets.only(bottom: 20),
            //                 child: Text(
            //                   'Syarat & Ketentuan',
            //                   style: TextStyle(
            //                     decoration: TextDecoration.underline,
            //                   ),
            //                 ),
            //               ),
            //             );
            //           } else {
            //             return Container();
            //           }
            //         }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
