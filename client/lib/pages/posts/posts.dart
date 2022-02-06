import 'package:client/widgets/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import '../../widgets/pill.dart';
import '../../widgets/post_card.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  String category = "";

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
  static final List<PostItem> posts = [
    PostItem(
        id: "1",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics",
        description:
            "Dix personnes ont été arrêtées et les policiers ont distribué 144 constats d’infraction lors d’une manifestation contre les mesures sanitaires samedi à Montréal. L’agent Raphaël Bergeron, porte-parole du Service de police de Montréal (SPVM), a fait état du bilan en début de soirée. « On parle d’accusations d’entraves, une personne a aussi été arrêtée en vertu d’un mandat d’arrestation, on parle de possession d’arme et de voie de fait sur policier."),
    PostItem(
        id: "2",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics",
        description:
            "Dix personnes ont été arrêtées et les policiers ont distribué 144 constats d’infraction lors d’une manifestation contre les mesures sanitaires samedi à Montréal. L’agent Raphaël Bergeron, porte-parole du Service de police de Montréal (SPVM), a fait état du bilan en début de soirée. « On parle d’accusations d’entraves, une personne a aussi été arrêtée en vertu d’un mandat d’arrestation, on parle de possession d’arme et de voie de fait sur policier."),
    PostItem(
        id: "3",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics",
        description:
            "Dix personnes ont été arrêtées et les policiers ont distribué 144 constats d’infraction lors d’une manifestation contre les mesures sanitaires samedi à Montréal. L’agent Raphaël Bergeron, porte-parole du Service de police de Montréal (SPVM), a fait état du bilan en début de soirée. « On parle d’accusations d’entraves, une personne a aussi été arrêtée en vertu d’un mandat d’arrestation, on parle de possession d’arme et de voie de fait sur policier."),
    PostItem(
        id: "4",
        title: "Jody Wilson-Raybould to headline Diversity Thunder Bay talk",
        image:
            "https://images.radio-canada.ca/q_auto,w_1250/v1/ici-info/16x9/manifestation-montreal-13-mars-mesures-sanitaires.jpg",
        category: "Politics",
        description:
            "Dix personnes ont été arrêtées et les policiers ont distribué 144 constats d’infraction lors d’une manifestation contre les mesures sanitaires samedi à Montréal. L’agent Raphaël Bergeron, porte-parole du Service de police de Montréal (SPVM), a fait état du bilan en début de soirée. « On parle d’accusations d’entraves, une personne a aussi été arrêtée en vertu d’un mandat d’arrestation, on parle de possession d’arme et de voie de fait sur policier."),
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
                    "News",
                  ),
                )
              ];
            },
            body: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 40,
                    child: category.length == 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 15.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return Pressable(
                                  onTap: () {
                                    setState(() {
                                      category = categories[index];
                                    });
                                  },
                                  child: Pill(text: categories[index]));
                            })
                        : Container(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Pill(
                                  text: category,
                                  color: kSECONDARY_TEXT_COLOR,
                                ),
                                Pressable(
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: kSECONDARY_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        category = "";
                                      });
                                    })
                              ],
                            ),
                          )),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostCard(post: posts[index]);
                    },
                  ),
                )
              ],
            )));
  }
}
