// ignore_for_file: prefer_const_constructors, await_only_futures, annotate_overrides, avoid_print, file_names

import 'package:apptime/model/pictable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/Usermodel.dart';
import 'package:apptime/utility/style.dart';

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
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[MyStyle().lightColor, MyStyle().wColor],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          MyStyle().showLogo(),
          Center(
            child: InteractiveViewer(
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: pic == null
                      ? CircularProgressIndicator()
                      : Image.network(pic!.urlPic),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
