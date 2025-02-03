import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssociateMethods {
  showSnackBarMsg(String msg, BuildContext ctx) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }
}
