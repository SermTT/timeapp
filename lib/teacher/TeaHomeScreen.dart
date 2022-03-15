// ignore_for_file: await_only_futures, annotate_overrides, avoid_print, non_constant_identifier_names, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:apptime/model/TeacherModel.dart';
import 'package:apptime/teacher/QrScan.dart';
import 'package:apptime/utility/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TeaHomeScreen extends StatefulWidget {
  TeaHomeScreen({Key? key}) : super(key: key);

  @override
  State<TeaHomeScreen> createState() => _TeaHomeScreenState();
}

class _TeaHomeScreenState extends State<TeaHomeScreen> {
  TeacherModel? teacherModel;
  Future findProfile() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String uid = event!.uid;
      print('## uid = $uid');
      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(uid)
          .get()
          .then((value) {
        if (!mounted) return;
        setState(() {
          teacherModel = TeacherModel.fromMap(value.data()!);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    findProfile();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: teacherModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${teacherModel!.teaname}',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QRViewExample()));
                    },
                    child: Container(
                        width: 160,
                        height: 160,
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: MyStyle().aColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_2,
                              size: 80,
                              color: MyStyle().wColor,
                            ),
                            Text(
                              "เช็คชื่อนักเรียน",
                              style: TextStyle(
                                  color: MyStyle().wColor, fontSize: 20),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Logout()
                ],
              ),
            ),
    ));
  }

  TextButton Logout() => TextButton(
      onPressed: () async {
        await Firebase.initializeApp().then((value) async {
          await FirebaseAuth.instance.signOut().then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, '/authen', (route) => false));
        });
      },
      child: const Text('ออกจากระบบ'),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ));
}
