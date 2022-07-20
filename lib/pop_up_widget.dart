import 'package:flutter/material.dart';

/* PopUp Widget */
Widget buildPopupDialog(BuildContext context, String title, String description) {
  return  AlertDialog(
    title: Text(title),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(description),
      ],
    ),
    actions: <Widget>[
       TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}