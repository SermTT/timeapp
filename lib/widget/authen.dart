// ignore_for_file: prefer_const_constructors, unused_import

import 'package:apptime/model/TeacherModel.dart';
import 'package:apptime/teacher/TeaHomeScreen.dart';
import 'package:apptime/widget/slelct_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/dialog.dart';
import 'package:apptime/utility/style.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  late double screen;
  late bool statusRedEye = true;
  late String user, password;

  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print('screen = $screen');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: <Color>[MyStyle().lightColor, MyStyle().primaryColor],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyStyle().showLogo(),
                // const SizedBox(
                //   height: 10,
                // ),
                BuildUser(),
                BuildPassword(),
                const SizedBox(
                  height: 20,
                ),
                BuildbtnLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildbtnLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 50,
      width: screen * 0.3,
      child: ElevatedButton(
        onPressed: () {
          // ignore: avoid_print
          print('user = $user, pass = $password ');

          if (user.isEmpty || password.isEmpty) {
            // ignore: avoid_print
            print('Have space');
            normalDialog(context, 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
          } else {
            checkAuthen();
            // ignore: avoid_print
            print('No space');
          }
        },
        child: const Text('Log in'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().aColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildUser() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyStyle().wColor,
      ),
      margin: const EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          hintText: 'Username',
          prefixIcon: Icon(
            Icons.perm_identity,
            color: MyStyle().bColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyStyle().wColor,
      ),
      margin: const EdgeInsets.only(top: 16),
      width: screen * 0.6,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              color: MyStyle().bColor,
              icon: statusRedEye
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                // ignore: avoid_print
                print('statusRedeye = $statusRedEye');
              }),
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().bColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildLogo() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: screen * 0.4,
      child: MyStyle().showLogo(),
    );
  }

  Future<void> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SelectUser()));
      })
          // ignore: invalid_return_type_for_catch_error
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}
