import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = const Color(0xff8d8d8d);
  Color primaryColor = const Color(0xffa2ff8d);
  Color lightColor = const Color(0xff6ee1ff);
  Color wColor = const Color(0xffffffff);
  Color bColor = const Color(0xff000000);
  Color aColor = const Color(0xffcc5353);

  Widget showLogo() => Image.asset('images/school.png');

  Widget titleH1(String string) => Text(
        string,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      );

      Widget titleH2(String string) => Text(
        string,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );

      Widget titleH3(String string) => Text(
        string,
        style: const TextStyle(
          fontSize: 16,
        ),
      );

  MyStyle();
}
