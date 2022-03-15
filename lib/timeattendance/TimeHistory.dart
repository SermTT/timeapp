// ignore_for_file: non_constant_identifier_names, await_only_futures, file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apptime/model/Timemodel.dart';

class TimeHistory extends StatefulWidget {
  const TimeHistory({Key? key}) : super(key: key);

  @override
  State<TimeHistory> createState() => _TimeHistoryState();
}

class _TimeHistoryState extends State<TimeHistory> {
  List<Timemodel> timeModel = [];
  List<String> HistoryDay = [];
  Future History() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String? uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .collection('timeattendance')
          .get()
          .then((value) {
        for (var item in value.docs) {
          setState(() {
            Timemodel model = Timemodel.fromMap(item.data());
            timeModel.add(model);
          });
        }
      });
    });
  }

  Widget CheckHistory() {
    return Container(
      height: 650,
      width: 400,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 10,
          spreadRadius: 1,
          offset: const Offset(0, 0),
        )
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: timeModel.map((e) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${e.timecheck.substring(6, 8)}/${e.timecheck.substring(4, 6)}/${e.timecheck.substring(0, 4)}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("มาเรียน",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    History();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการมาเรียน'),
      ),
      body: timeModel == null
          ? Center(
              child: LinearProgressIndicator(),
            )
          : Center(
              child: Center(
                child: Column(
                  children: [
                    CheckHistory(),
                    Text('จำนวนวันมาเรียนทั้งหมดของนักเรียน ${timeModel.length} วัน')
                  ],
                ),
              ),
            ),
    );
  }
}
