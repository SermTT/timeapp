import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/Usermodel.dart';
import '../model/score.dart';

class mathScore extends StatefulWidget {
  const mathScore({Key? key}) : super(key: key);

  @override
  _mathScoreState createState() => _mathScoreState();
}

class _mathScoreState extends State<mathScore> {
  UserModel? userModel;
  List<ScoreModel> scoreModel = [];
  String? score, note;

  Future findProfile() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String uid = event!.uid;
      print('## uid = $uid');
      await FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .get()
          .then((value) {
        setState(() {
          userModel = UserModel.fromMap(value.data()!);
        });
      });
    });
  }

  Future findScoreMath() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String uidM = event!.uid;
      await FirebaseFirestore.instance
          .collection('students')
          .doc(uidM)
          .collection('math')
          .get()
          .then((value) {
        for (var item in value.docs) {
          ScoreModel model = ScoreModel.fromMap(item.data());
          setState(() {
            scoreModel.add(model);
          });
        }
      });
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    findProfile();
    findScoreMath();
  }

  Widget listScore() {
    return Container(
      color: Colors.white,
      height: 550,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: scoreModel.map((e) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${e.note}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "${e.score}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คณิตศาสตร์"),
      ),
      body: scoreModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(0.9)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // padding:
                    //     const EdgeInsets.only(left: 10, right: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text("รายละเอียด",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Expanded(child: Container()),
                            Text("คะแนน",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        listScore(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
