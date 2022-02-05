import 'package:flutter/cupertino.dart';

import 'package:client/constants.dart';

import '../../widgets/pill.dart';
import '../../widgets/post_card.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  // Import categories once backend implemented
  static final List<String> categories = [
    "Sports",
    "Politics",
    "News",
    "Tech",
    "Health",
    "Finance",
    "Community"
  ];

  // Import posts once backend implemented
  static final List<Post> posts = [
    Post(
        id: "1234",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics"),
    Post(
        id: "1234",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics"),
    Post(
        id: "1234",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics"),
    Post(
        id: "1234",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics"),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text(
                    "Stories",
                  ),
                )
              ];
            },
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    padding: const EdgeInsets.all(15.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostCard(post: posts[index]);
                    },
                  ),
                ],
              ),
            )));
  }
}
