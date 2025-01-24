import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {String msg = ''}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(msg)));
}
