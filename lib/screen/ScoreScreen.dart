// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'package:apptime/Subjects/Art.dart';
import 'package:apptime/Subjects/Car.dart';
import 'package:apptime/Subjects/Com.dart';
import 'package:apptime/Subjects/Eng.dart';
import 'package:apptime/Subjects/Guid.dart';
import 'package:apptime/Subjects/Math.dart';
import 'package:apptime/Subjects/Pe.dart';
import 'package:apptime/Subjects/Sci.dart';
import 'package:apptime/Subjects/Soc.dart';
import 'package:apptime/Subjects/Thai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apptime/utility/style.dart';
import '../model/Usermodel.dart';
import 'package:apptime/utility/style.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[MyStyle().primaryColor, MyStyle().wColor],
              ),
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                MyStyle().showLogo(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const thaiScore()));
                          },
                          child: Ink(
                            child: Center(child: MyStyle().titleH2('ภาษาไทย')),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const mathScore()));
                          },
                          child: Ink(
                            child:
                                Center(child: MyStyle().titleH2('คณิตศาสตร์')),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const engScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('ภาษาอังกฤษ'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sciScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('วิทยาศาสตร์'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const comScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('คอมพิวเตอร์'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const scoScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('สังคมศึกษา'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const peScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('สุขศึกษา'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const artScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('ศิลปะ'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const carScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('การงานอาชีพ'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.3),
                          splashColor: Colors.red.withOpacity(0.5),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const guidScore()));
                          },
                          child: Ink(
                            child: Center(
                              child: MyStyle().titleH2('แนะแนว'),
                            ),
                            color: MyStyle().aColor,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
