import 'package:client/constants.dart';
import 'package:client/widgets/comment.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Panel extends StatefulWidget {
  final PostItem post;

  const Panel({Key? key, required this.post}) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController _textController = TextEditingController();

  String _text = "";
  bool _isLoading = false;

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
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection("comments")
                  .where('postId', isEqualTo: widget.post.id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;
                  documents.sort((a, b) =>
                      b['date'].toString().compareTo(a['date'].toString()));
                  List<Comment> comments = [];
                  for (var document in documents) {
                    comments.add(Comment(
                      author: document['author'],
                      text: document['text'],
                      date: document['date'],
                    ));
                  }

                  if (comments.isEmpty) {
                    return const Center(
                      child: Text(
                        "There are no comments",
                        style: TextStyle(color: kSECONDARY_TEXT_COLOR),
                      ),
                    );
                  }

                  return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      children: comments);
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 20,
                    ),
                  );
                }
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
                  Expanded(
                    child: CupertinoTextField(
                      controller: _textController,
                      onChanged: (value) {
                        setState(() {
                          _text = value;
                        });
                      },
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      placeholder: "Enter comment",
                    ),
                  ),
                  Pressable(
                    isLoading: _isLoading,
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      try {
                        final user = _auth.currentUser;

                        if (user == null || _text.isEmpty) {
                          throw Error();
                        }

                        setState(() {
                          _isLoading = true;
                        });

                        await _firestore.collection("comments").add({
                          "text": _text,
                          "author": user.email,
                          "date": DateTime.now(),
                          "postId": widget.post.id
                        });

                        setState(() {
                          _isLoading = false;
                          _textController.text = "";
                        });
                      } catch (e) {
                        setState(() {
                          _isLoading = false;
                          _textController.text = "";
                        });
                        print(e);
                      }
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
