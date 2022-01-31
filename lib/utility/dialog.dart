import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/x.png'),
        title: Text(string),
      ),children: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),],
    ),
  );
}
// 