// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: userModel == null? Center(child: CircularProgressIndicator(),) : Center(
        
        // ignore: unnecessary_string_interpolations
        child: Container(
          padding: EdgeInsets.only(top:70,left: 30,right: 30),
          child: Column(
            children: [
              Text('${userModel!.stuname}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text('${userModel!.stunum}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Text('${userModel!.email}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${userModel!.nroom}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
                  Text("/"),
                  Text('${userModel!.croom}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
                ],
              )
            ],
          ),
        ),
        
        
      ),
    );
  }
}
