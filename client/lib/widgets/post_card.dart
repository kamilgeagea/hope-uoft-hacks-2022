import 'package:flutter/cupertino.dart';

import 'package:client/constants.dart';
import 'package:flutter/material.dart';

import '../pages/posts/post.dart';
import './pressable.dart';

class PostCard extends StatefulWidget {
  final PostItem post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            opaque: false,
            transitionDuration: const Duration(milliseconds: 700),
            fullscreenDialog: true,
            pageBuilder: (context, _, __) => Post(
                  post: widget.post,
                ),
            settings: RouteSettings(arguments: widget.post.id)));
      },
      child: Hero(
        tag: widget.post.id,
        child: Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBORDER_RADIUS),
            color: kSECONDARY_COLOR,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kBORDER_RADIUS),
                  topRight: Radius.circular(kBORDER_RADIUS),
                ),
                child: Image.network(widget.post.image,
                    height: 300, fit: BoxFit.cover),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.category,
                      style: const TextStyle(
                          color: kACCENT_COLOR, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 7.0),
                    Text(
                      widget.post.title,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        flightShuttleBuilder:
            (flightContext, animation, direction, fromcontext, toContext) {
          final Hero toHero = toContext.widget as Hero;
          // Change push and pop animation.
          return direction == HeroFlightDirection.push
              ? ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(
                      begin: 0.75,
                      end: 1.02,
                    ).chain(
                      CurveTween(
                          curve: const Interval(0.4, 1.0,
                              curve: Curves.easeInOut)),
                    ),
                  ),
                  child: toHero.child,
                )
              : SizeTransition(
                  sizeFactor: animation,
                  child: toHero.child,
                );
        },
      ),
    );
  }
}
