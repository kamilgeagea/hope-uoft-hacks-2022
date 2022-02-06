import 'package:client/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comment extends StatelessWidget {
  final String author;
  final Timestamp date;
  final String text;
  const Comment(
      {Key? key, required this.author, required this.date, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                author.substring(0, author.indexOf("@")),
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kACCENT_COLOR),
              ),
              const SizedBox(width: 10.0),
              Text(
                timeago.format(date.toDate()),
                style: const TextStyle(color: kSECONDARY_TEXT_COLOR),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
