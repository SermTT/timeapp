// ignore_for_file: annotate_overrides, prefer_const_constructors

import 'package:apptime/model/Usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/TeacherModel.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  TeacherModel? teacherModel;
  UserModel? userModel;

  Future find() async {
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
            FirebaseFirestore.instance
          .collection('teachers')
          .where('cid', isEqualTo: userModel!.cid)
          .get()
          .then((value) {
            setState(() {
              teacherModel = TeacherModel.fromMap(value.docs[0].data());
            });
      });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    find();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: teacherModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              // ignore: unnecessary_string_interpolations
              child: Container(
                padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                child: Column(
                  children: [
                    Text(
                      '${teacherModel!.email}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Text(
                      //'${teacherModel!.nroom}',
                      //style: TextStyle(
                        //fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      //),
                   //),
                    Text(
                      '${teacherModel!.teaname}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${teacherModel!.teanum}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${teacherModel!.nroom}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("/"),
                        Text(
                          '${teacherModel!.croom}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
