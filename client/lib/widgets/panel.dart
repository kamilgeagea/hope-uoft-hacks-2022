import 'package:client/constants.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  static final List<CommentItem> comments = [
    CommentItem(
        id: '1',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '2',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '3',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '4',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '5',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '6',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '7',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '8',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '9',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '10',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '11',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '12',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
    CommentItem(
        id: '13',
        userId: 'user1',
        postId: '1',
        date: '5 minutes ago',
        text: 'awesome article, thanks for posting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: const Text(
              "Comments",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            comments[index].userId,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kACCENT_COLOR),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            comments[index].date,
                            style:
                                const TextStyle(color: kSECONDARY_TEXT_COLOR),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        comments[index].text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 10.0,
                right: 15.0,
                left: 15.0,
                bottom: MediaQuery.of(context).viewInsets.bottom + 15.0),
            color: kSECONDARY_COLOR,
            child: SafeArea(
              child: Row(
                children: [
                  const Expanded(
                    child: CupertinoTextField(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      placeholder: "Enter comment",
                    ),
                  ),
                  Pressable(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          color: kACCENT_COLOR, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
  }
}
