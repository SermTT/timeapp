import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../screen/CheckstatusScreen.dart';
import '../screen/ContactScreen.dart';
import '../screen/HomeScreen.dart';
import '../screen/ScoreScreen.dart';
import '../screen/TableScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pagelist = <Widget>[
    const HomeScreen(),
    const CheckstatusScreen(),
    const ScoreScreen(),
    const TableScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pageList[pageIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pagelist[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 110, 225, 255),
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าหลัก"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled_sharp), label: "การมาเรียน"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_score_rounded), label: "คะแนน"),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart_sharp), label: "ตารางเรียน"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "ติดต่อ"),
        ],
      ),
    );
  }
}
