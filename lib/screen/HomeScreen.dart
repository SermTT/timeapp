// ignore_for_file: prefer_const_constructors, await_only_futures, avoid_print, file_names, unused_field, unnecessary_string_interpolations

import 'package:apptime/widget/slelct_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/style.dart';
import '../model/Usermodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('students');
  UserModel? userModel;

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

  @override
  void initState() {
    // TODO: implement initState
    findProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              // ignore: unnecessary_string_interpolations
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[MyStyle().primaryColor, MyStyle().wColor],
                  ),
                ),
                padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                child: Column(
                  children: [
                    MyStyle().showLogo(),
                    const SizedBox(
                      height: 40,
                    ),
                    MyStyle().showLogoStu(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'ชื่อ : ${userModel!.stuname} ${userModel!.stulastname}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'รหัสประจำตัว : ${userModel!.stunum}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ชั้นปี : ${userModel!.nroom}/${userModel!.croom}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'อีเมล : ${userModel!.email}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectUser()));
                      },
                      child: Text('กลับหน้าเลือกนักเรียน'),
                      style: ElevatedButton.styleFrom(
                        primary: MyStyle().aColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
