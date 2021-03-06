// ignore_for_file: non_constant_identifier_names

import 'package:apptime/model/TeacherModel.dart';
import 'package:apptime/model/Usermodel.dart';
import 'package:apptime/teacher/TeaHomeScreen.dart';
import 'package:apptime/widget/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/style.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  

  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  late double screen;
  List<TeacherModel> teacherModel = [];
  String? uid;
  UserModel? userModel;

  Future findTeacher () async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('students')
          .doc(uid)
          .get()
          .then((value) {
        setState(() {
          userModel = UserModel.fromMap(value.data()!);
        });
      });
      print("##$uid");
      await FirebaseFirestore.instance.collection('teachers').get().then((value) {
        for (var item in value.docs) {
          TeacherModel model = TeacherModel.fromMap(item.data());
          // print("##${model.uid}");
          if(!mounted)return;
          if (uid == model.uid) {
            setState(() {
              Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TeaHomeScreen()));
            });
          }
        }
      });
     });
  }
  @override
  void initState() {
    super.initState();
    findTeacher();
  }
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print('screen = $screen');
    return Scaffold(
        floatingActionButton: Logout(),
        appBar: AppBar(
          title: const Text(
            'Select User',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color>[MyStyle().lightColor, MyStyle().primaryColor],
              ),
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selectuser(),
          ],
        )));
  }

  TextButton Logout() => TextButton(
      onPressed: () async {
        await Firebase.initializeApp().then((value) async {
          await FirebaseAuth.instance.signOut().then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, '/authen', (route) => false));
        });
      },
      child: const Text('??????????????????????????????'),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ));

  SizedBox Selectuser() {
    return SizedBox(
      width: screen * 0.65,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        },
        child:userModel==null?Text('???????????????????????????...'): Text('${userModel!.stuname} ${userModel!.stulastname}'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().aColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
