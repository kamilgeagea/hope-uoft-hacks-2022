import "package:flutter/cupertino.dart";

class Pressable extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const Pressable({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  _PressableState createState() => _PressableState();
}

class _PressableState extends State<Pressable>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this,
        value: 1.0,
        upperBound: 1.0,
        lowerBound: 0.9);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        controller.reverse(from: 1.0);
      },
      onTapUp: (_) async {
        await controller.forward(from: 0.8);
        widget.onTap();
      },
      onTapCancel: () {
        controller.forward(from: 0.8);
      },
      child: Transform.scale(
        scale: controller.value,
        child: widget.child,
      ),
    );
  }
}
