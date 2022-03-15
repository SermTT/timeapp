// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:apptime/model/Timemodel.dart';
import 'package:apptime/timeattendance/TimeHistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/style.dart';

class CheckstatusScreen extends StatefulWidget {
  const CheckstatusScreen({Key? key}) : super(key: key);

  @override
  _CheckstatusScreenState createState() => _CheckstatusScreenState();
}

class _CheckstatusScreenState extends State<CheckstatusScreen> {
  List<Timemodel> timeModel = [];
  Timestamp time = Timestamp.fromDate(DateTime.now());
  bool status = false;
  int check = 0;
  Future ShowTimeAttendance() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String? uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .collection('timeattendance')
          .get()
          .then((value) {
        for (var item in value.docs) {
          Timemodel model = Timemodel.fromMap(item.data());
          if (!mounted) return;
          if (model.timecheck ==
              '${time.toDate().year}${time.toDate().month < 10 ? '0${time.toDate().month}' : time.toDate().month}${time.toDate().day < 10 ? '0${time.toDate().day}' : time.toDate().day}') {
            setState(() {
              status = true;
            });
          }
        }
        setState(() {
          check = 1;
        });
      });
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    ShowTimeAttendance();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[MyStyle().lightColor, MyStyle().wColor],
          ),
        ),
        child: check == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  MyStyle().showLogo(),
                  SizedBox(height: 60),
                  Center(
                    child: status
                        ? MyStyle().titleH2g('วันนี้ลูกของคุณมาเรียนแล้ว')
                        : MyStyle().titleH2r('วันนี้ลูกของคุณไม่มาโรงเรียน'),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TimeHistory()));
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
                              Icons.access_time,
                              size: 80,
                              color: MyStyle().wColor,
                            ),
                            Text(
                              "ดูการมาเรียน",
                              style: TextStyle(
                                  color: MyStyle().wColor, fontSize: 20),
                            )
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
