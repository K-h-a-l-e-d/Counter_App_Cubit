import 'package:flutter/material.dart';

Future<void> showDialogMsg(context,
    {String title = '', String subTitle = ''}) async {
  String dialogTitle = title;
  String dialogSubTitle = subTitle;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(dialogTitle),
        content: Text(dialogSubTitle),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
