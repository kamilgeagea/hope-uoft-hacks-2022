import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                "Stories",
              ),
            )
          ];
        },
        body: const Center(
          child: Text("Stories"),
        ),
      ),
    );
  }
}
