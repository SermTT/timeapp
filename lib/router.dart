import 'package:apptime/widget/authen.dart';
import 'package:apptime/widget/slelct_user.dart';
import 'package:apptime/widget/navbar.dart';
import 'package:flutter/material.dart';



final Map<String, WidgetBuilder> routes = {
  '/authen':(BuildContext context)=>  const Authen(),
  '/select':(BuildContext context)=> const SelectUser(),
  '/menu':(BuildContext context) => const MainScreen(),
};