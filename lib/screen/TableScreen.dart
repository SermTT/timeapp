// ignore_for_file: prefer_const_constructors

import 'package:apptime/model/pictable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/Usermodel.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('students');
  UserModel? userModel;
  PicTables? pic;

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
      }).then((value) {
        FirebaseFirestore.instance
            .collection('tables')
            .doc("tb${userModel!.cid}")
            .get()
            .then((value) {
          setState(() {
            pic = PicTables.fromMap(value.data()!);
          });
          print("## ${pic!.urlPic}");
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
        body: Center(
      child: pic == null
          ? CircularProgressIndicator()
          : Image.network(pic!.urlPic),
    ));
  }
}
