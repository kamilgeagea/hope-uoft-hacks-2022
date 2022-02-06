import 'package:client/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color color;

  const Pill({Key? key, required this.text, this.color = kSECONDARY_COLOR})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBORDER_RADIUS),
        color: color,
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
