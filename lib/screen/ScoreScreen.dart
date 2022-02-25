// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'package:apptime/Subjects/Math.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/Usermodel.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  

  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const mathScore()));
                },
                child: Text("math")),
            ElevatedButton(onPressed: () {}, child: Text("thai")),
            ElevatedButton(onPressed: () {}, child: Text("eng")),
          ],
        ),
      ),
    );
  }
}
