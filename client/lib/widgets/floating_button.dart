import "package:flutter/material.dart";
import "./pressable.dart";
import "../constants.dart";

class FloatingButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  const FloatingButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Pressable(
        onTap: onTap,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: kACCENT_COLOR, borderRadius: BorderRadius.circular(100)),
          child: icon,
        ),
      ),
    );
  }
}
