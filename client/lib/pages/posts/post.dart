import 'dart:async';
import 'package:client/widgets/floating_button.dart';
import 'package:client/widgets/panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:client/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Post extends StatefulWidget {
  final PostItem post;
  const Post({Key? key, required this.post}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with TickerProviderStateMixin {
  late AnimationController _heightController;
  late Animation<double> _heightAnimation;

  late Animation<double> _heightBackAnimation;

  late AnimationController _closeController;
  late Animation _closeAnimation;

  late double _initPoint;
  late double _verticalDistance;

  late bool _needPop;
  late bool _isTop;
  late bool _opacity;

  bool _showContent = true;

  @override
  void initState() {
    _needPop = true;
    _isTop = true;
    _opacity = false;

    _heightController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _closeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _closeAnimation =
        Tween<double>(begin: 1.0, end: 0.75).animate(_closeController);
    _heightAnimation = Tween<double>(begin: 0.9, end: 1).animate(
        CurvedAnimation(parent: _heightController, curve: Curves.easeIn));
    _heightBackAnimation = Tween<double>(begin: 0.6, end: 1).animate(
        CurvedAnimation(parent: _heightController, curve: Curves.easeIn));

    super.initState();

    _heightController.forward();

    Timer(const Duration(milliseconds: 250), () {
      setState(() {
        _opacity = true;
      });
    });
  }

  @override
  void dispose() {
    _closeController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget _content = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 400,
          leading: Container(),
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: widget.post.id,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    bottomLeft: _showContent
                        ? Radius.zero
                        : const Radius.circular(20.0),
                    bottomRight: _showContent
                        ? Radius.zero
                        : const Radius.circular(20.0)),
                child: Image.network(widget.post.image, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _showContent
                ? Container(
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.post.category,
                            style: const TextStyle(
                                color: kACCENT_COLOR,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            widget.post.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: kLARGE_FONT),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(widget.post.description),
                          const SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                      FloatingButton(
                          icon: const Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                          ),
                          onTap: () {
                            showCupertinoModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                builder: (context) => const Panel());
                          })
                    ]),
                  )
                : Container(),
          ]),
        ),
      ],
    );

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: AnimatedBuilder(
        animation: _closeAnimation,
        builder: (context, _child) {
          return Transform.scale(
            scale: _closeAnimation.value,
            child: _child,
          );
        },
        child: AnimatedOpacity(
          opacity: _opacity ? 1 : 0,
          duration: const Duration(milliseconds: 150),
          child: SizeTransition(
            sizeFactor: _needPop ? _heightAnimation : _heightBackAnimation,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 300),
              child: Listener(
                onPointerDown: (opm) {
                  _initPoint = opm.position.dy;
                },
                onPointerUp: (opm) {
                  setState(() {
                    _showContent = true;
                  });
                  if (_needPop) {
                    _closeController.reverse();
                  }
                },
                onPointerMove: (opm) {
                  _verticalDistance = -_initPoint + opm.position.dy;
                  if (_verticalDistance >= 0) {
                    setState(() {
                      _showContent = false;
                    });
                    // Scroll up
                    if (_isTop &&
                        _verticalDistance < SCALE_ANIMATION_STANDARD) {
                      double _scaleValue = double.parse(
                          (_verticalDistance / 100).toStringAsFixed(2));
                      _closeController.animateTo(_scaleValue,
                          duration: const Duration(milliseconds: 0),
                          curve: Curves.linear);
                    } else if (_isTop &&
                        _verticalDistance >= SCALE_ANIMATION_STANDARD &&
                        _verticalDistance < POP_STANDARD) {
                      _closeController.animateTo(1,
                          duration: const Duration(milliseconds: 0),
                          curve: Curves.linear);
                    } else if (_isTop && _verticalDistance >= POP_STANDARD) {
                      if (_needPop) {
                        _needPop = false;
                        _closeController.fling(velocity: 1).then((_) {
                          _heightController.reverse();
                          Navigator.of(context).pop();
                          _opacity = false;
                        });
                      }
                    }
                  } else {
                    setState(() {
                      _showContent = true;
                    });
                    _isTop = false;
                  }
                },
                child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        double scrollDistance =
                            scrollNotification.metrics.pixels;

                        if (scrollDistance <= 3) {
                          _isTop = true;
                        }
                      }

                      return true;
                    },
                    child: _content),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
