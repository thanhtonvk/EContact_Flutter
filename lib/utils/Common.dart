import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common{
  static void  showLoaderDialog(BuildContext context,String content) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 50), child: Text(content)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}