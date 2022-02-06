import 'package:client/pages/launch.dart';
import 'package:client/widgets/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import '../../widgets/pill.dart';
import '../../widgets/post_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final _auth = FirebaseAuth.instance;
  String category = "";

  // Import categories once backend implemented
  static final List<String> categories = [
    "Politics",
    "Business",
    "Science",
    "Sports",
    "Entertainment",
    "Tech",
    "Environment",
    "Education"
  ];

  // Import posts once backend implemented
  static final List<PostItem> posts = [
    PostItem(
        id: "0",
        title:
            "Ginger Cat is Local Star for Stealing Hundreds of Toys and Presenting Them Sweetly to Neighbors",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/02/Kay-McCall-toys-and-cat-pic-by-Ingrid-Moyle.jpg",
        category: "Entertainment",
        description:
            "Kay McCall and her husband were moving into a new apartment last year in Ferny Hills, near Brisbane, when they met a ginger cat who hopped over the fence looking for a head pat and chin scratches. It became an enjoyable daily encounter, but as the visits continued they began to notice an accumulation of toys in their yard. It wasn’t long before they caught him in the act. It turned out, the orange visitor was bringing more than affection and neighborliness. McCall says he left in their yard several odd socks, a school tee-shirt, and lots of toys. He brought a beautiful little Peter Rabbit, she told ABC News Australia. After a while, we just accumulated a ridiculous number—literally an entire table-full. They decided to post a picture of the “Pirate Kitty” and his haul on a Facebook group for locals, seeing if any of the toys belonged to the neighbors. Indeed, dozens of people reported they had been visited by Pirate Kitty, or recognized one of this plundered items— and he instantly became a local icon."),
    PostItem(
        id: "1",
        title:
            "500 Acres of Old Growth Redwood Forests Donated to Tribal Council for Lasting Protection in Mendocino, Calif",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/02/old-trees-released-Photo-credit-Max-Forster-Photography-courtesy-of-Save-the-Redwoods-League.jpg",
        category: "Environment",
        description:
            "For a second time, the nonprofit Save the Redwoods League has orchestrated a donation of coastal redwood forestland to the InterTribal Sinkyone Wilderness Council to permanently protect trees on the Lost Coast in Mendocino County, California. The League purchased the 523-acre property, formerly known as Andersonia West, in 2020. To ensure its lasting protection, the conservation group transferred ownership to the Sinkyone Council, which then granted the League a conservation easement. Through the partnership, the Sinkyone people resume guardianship of a land they lived on generations ago, before European settlers moved in—and the forest will again be known as Tc’ih-Léh-Dûñ (pronounced tsih-ih-LEY-duhn), meaning Fish Run Place"),
    PostItem(
        id: "2",
        title:
            "Iconic Pink Flamingos Are Coming Back and Standing Tall in Florida",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/02/flamingoes-Florida-Flamingos-Working-Group-facebook-social-media-embed.jpg",
        category: "Environment",
        description:
            "Once extirpated from Florida such that it lost its status as a native species, the American Flamingo is being sighted again in the state’s rich wetlands, prompting conservationists to feel the time is right for a rose-colored renaissance of the famous bird. Not only are wildlife tour guides and the like spotting the tall pink waders, but scientists who work with GPS collars to track the birds are finding that they are once again making their homes in places like the Everglades. Considered for 100 years as rare migrants to Florida’s shores, flamingos are now known to visit annually, or even stay year round. A 2021 biological assessment released by the Florida Fish and Wildlife Commission stated that there were somewhere between 0 and 1,000 individuals in Florida."),
    PostItem(
        id: "3",
        title: "Top Skills American Teens Want to Learn and Do After School",
        image:
            "https://icld.se/wp-content/uploads/2021/12/Youth-Duy-Pha_Unsplash-beskuren.jpg",
        category: "Education",
        description:
            "Teens today are looking to forge their own success and happiness in their future careers. A recent survey of 2,000 American high school students found that although a third of respondents have no post-graduation plans, 82% agree the most important thing to them is to do something they’re passionate about, regardless of what career they choose. Seven in 10 (69%) said it’s important to have a job immediately after graduating, while others consider higher education more polarizing. Over half of students surveyed (55%) believe college isn’t a requirement for a successful career, compared to 45% who think it’s mandatory. For students who haven’t considered any alternatives to higher education, half (51%) explained they didn’t know enough about other options, such as career paths in the skilled trades—hinting that students aren’t being exposed to those options in school. Commissioned by Wolverine and conducted by OnePoll, the poll revealed two-thirds saw how important essential workers and skilled trade careers were and continue to be during the pandemic, prompting 45% of students to show more interest in pursuing essential jobs. But getting there may be no easy feat for these students. A third of American high-schoolers want to learn how to pursue their goals (34%), money to pay for their education (33%) and how to deal with parental pressure (31%). The results also found students feel more pressure to pursue traditional higher education after high school than alternatives—a third (35%) have felt pressured to attend a traditional four-year college. Still, only 18% have felt the same pressure for vocational schools."),
    PostItem(
        id: "4",
        title:
            "Artist Makes Incredible Doll Houses of Miniature Film Sets From Harry Potter, Friends, and Jurassic Park",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/02/set-pieces-an-a-786102-swns.jpg",
        category: "Entertainment",
        description:
            "Bridget McCarty creates miniature film sets—but they’re so detailed you wouldn’t even know they were fake. Her works include iconic scenes from Jurassic Park, Friends, and Harry Potter and can take up to a month each to build, but the outcomes are astounding. Bridget, from Los Angeles, California, says it started as a hobby—but it became her full-time job when people started queueing up demanding to buy her pieces."),
    PostItem(
        id: "5",
        title:
            "English Island Seeks Landlord-King in Search of Solitude, Seals, and Beer",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/02/Piel_Island_and_Castle_Barrow-in-Furness-cc-license-wikimedia-commons-Geograph.jpg",
        category: "Politics",
        description:
            "Tender set to be launched for one of the most unique opportunities in UK hospitality, reads the Borough of Barrow at Furness website, which is looking for a new landlord to manage a pub on Piel Island, as well as to claim an ancient, beer-soaked royal throne carved from oak. The claimant should also be ready to be soaked himself, according to a bizarre tradition, and take up the title of King, and to oversee every degree of comings and goings on the small island on the northwest coast of England. Tradition holds that each new landlord is crowned ‘King of Piel’ in a ceremony of uncertain origin, the Barrow council described in a statement. Tony Callister, another member of the council, said in an interview that the custom would continue. The person coming in gets the title of King of Piel, which is nice to have, and there’s no reason for that to change. The job requires all 50 acres of island grounds to be tended to, for the Ship Inn pub and kitchens to be managed, and for all guests to be made welcome. Furthermore, potential kings should be prepared for loneliness, as there is only one other permanent resident, and the winter months see few visitors, but many storms."),
    PostItem(
        id: "6",
        title:
            "Notre Dame Cathedral Rises From the Ashes: Look at All They’ve Rebuilt Since the 2019 Blaze",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/01/Notre-Dame-cathedral-fire-drone-CBS-News-YouTube.jpg",
        category: "Politics",
        description:
            "When France hosts the 2024 Olympics, the plan is for Notre-Dame Cathedral to be restored to its former glory in time for the event. A team of 35 architects, masters in historical restoration, and international NGOs armed with a billion euro in donations from around the world—including 30 million from U.S donors—are busy helping the Parisian monument rise from the ashes."),
    PostItem(
        id: "7",
        title:
            "Bee Bricks That Help Thousands of Solitary Bees Are Now a Requirement for New Buildings in Brighton",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/01/bee-brick-greenandblueDOTcoDOTuk.jpg",
        category: "Science",
        description:
            "Since 250 of the 270 bee species in Britain are solitary buzzers, the city of Brighton and Hove is establishing mandates to use “bee bricks” in construction of all buildings above 5 meters to help encourage these solitary species to nest in them. Bee bricks are what appear to be blocks of Swiss cheese but which are actually a normal building bricks created with small cavities into which bees typically nest. Old brick buildings and crumbing walls have been observed as excellent habitat for bees, and so Brighton and Hove are trying to deploy this simple invention to offer more room on the metaphorical bed for the pollinating insects. They have also mandated “swift bricks,” which offer the same comforts of home, only for nesting swifts—tiny birds that spend a few months in the UK and then migrate to Africa. The Royal Society for the Protection of Birds is consulting with the government to identify which height on which buildings are ideal for the swift bricks."),
    PostItem(
        id: "8",
        title:
            "Live Cells Discovered in Human Breast Milk Could Lead to Future Breast Cancer Treatments",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2020/03/breast-cancer-survivors-in-Rome-running-race-pubdomain-Peter-Boccia.jpg",
        category: "Science",
        description:
            "Research at the University of Cambridge has found that breast milk cells, which were once thought to be dead or dying, are in fact alive and well. And these live cells in human breast milk could help scientists discover breakthrough treatments for breast cancer. The cells have given scientists clues about early indicators of the deadly disease, and will also help researchers understand how breast tissues change when women breastfeed. Dr. Alecia-Jane Twigger, lead author of the new study said, “Breast tissue is dynamic, changing over time during puberty, pregnancy, breastfeeding, and aging. “These living cells provide researchers with insight into a potential early indicator of future breast cancer development.”"),
    PostItem(
        id: "9",
        title:
            "Dolly Parton Launches Southern-Style Cake Mix and Frostings Line With Duncan Hines",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/01/Dolly-Parton-baking-cakes-by-Duncan-Hines.jpg",
        category: "Entertainment",
        description:
            "Entertainment icon Dolly Parton has launched a new line of ‘Southern-inspired’ desserts, manufactured by Duncan Hines, including cake mixes and frostings as an homage to some of Dolly’s favorite family recipes. “I have always loved to cook and, growing up in the South, I especially love that authentic Mom and Pop kind of cooking,” said the 76-year old singer who’s been nominated for 50 Grammys. “Baking was no different. My Mama, my grandmothers, and my aunts were all wonderful bakers.” “They taught me everything I know, from biscuits and gravy to chocolate cake.” Two of the new cake mixes due to arrive on grocery shelves in early March were based on her favorites, Coconut Cake and Banana Puddin’ Cake, but she is careful to call the new products, “coconut- or banana-flavored“. They were available at the Duncan Hines website, but quickly sold out. You can check back or sign up to be alerted when they are in stock this spring. f you want the real recipes, you will have to wait for a new Dolly Parton cookbook. Her 2006 recipe collection, entitled Dixie Fixin’s, features over 100 recipes from her childhood, but it is out of print and hard to find (except on Amazon for 500)."),
    PostItem(
        id: "10",
        title:
            "Scientists Find Giant Pristine Coral Reef Undiscovered Near Tahiti, With Clues There Are More",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/01/rose-coral-in-reef-near-tahiti-Alexis-Rosenfeld-via-1-Ocean.jpg",
        category: "Science",
        description:
            "A scientific research mission has discovered one of the largest coral reefs in the world off the coast of Tahiti. The pristine condition of the rose-shaped corals, and the sheer size of the reef, make this a rare discovery. Uncovered by photographer and explorer Alexis Rosenfeld, Founder of 1 Ocean, the highly valuable reef is almost 2 miles long and 200 feet (30-65m) below the surface. At 200 feet wide (30-65m), it is one of the most extensive healthy coral reefs on record. The giant rose-shaped corals, pictured in photos captured by Rosenfeld, are up to 6 feet in diameter (2 meters). Up until now, the vast majority of the world’s known coral reefs sit at depths of up to 82 feed (25m). So this discovery suggests that there are more large reefs out there, at greater depths."),
    PostItem(
        id: "11",
        title:
            "South Australia Smashes Renewable Record Using 100% Solar And Wind For Full Week",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2022/01/waterloo-wind-farm-south-australia-wikimedia-ccommons-cc-license-User-Stephkrie.jpg",
        category: "Business",
        description:
            "South Australia spent the last week of December generating 100% of its power demand from wind and solar. This isn’t unheard of for the sunny southern state in the Land Down Under, but rather the first time it’s happened for so many days in a row. Wind turbines supplied 64.4% of power, while rooftop PV panel generation provided 29.5%, and utility-scale solar averaged 6.2%. The state would have actually generated more than 100% of its demand but for a brief curtailment of semi-scheduled generation which reduced the totals by 8.2%. Over that period the contribution from natural gas averaged just 114 megawatts. The territory is populated by around 1.7 million people, mostly centered around the coast and in Adelaide, its capital city."),
    PostItem(
        id: "12",
        title:
            "Billionaire Mark Cuban Opens Online Pharmacy To Provide Affordable Generic Drugs",
        image:
            "https://www.goodnewsnetwork.org/wp-content/uploads/2021/01/pills-public-domain-mark-cuban-cc-license-Gage-Skidmore-.jpg",
        category: "Business",
        description:
            "Mark Cuban has officially launched his newest venture—the online pharmacy Cost Plus Drugs. GNN previously reported on Cuban’s support for Texas radiologist Dr. Alex Oshymansky, who started a public benefit company to provide cheap pharmaceutical drugs. The launch comes just weeks after the company’s pharmacy benefit manager (PBM) operation was established; both are efforts in the pursuit to help shield consumers from inflated drug prices. According to a September 2021 Gallup poll, 18 million Americans were recently unable to pay for at least one prescription medication for their household due to ever-rising costs, and 1 in 10 Americans have skipped doses to save money. The pharmacy’s launch represents the first milestone in bringing affordable medications to millions."),
  ];

  _showDialog(BuildContext context) async {
    bool isLoggingOut = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure that you want to logout?"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              CupertinoDialogAction(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });

    if (isLoggingOut) {
      await _auth.signOut();

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) => const Launch(),
              transitionDuration: Duration.zero));
    }
  }

  @override
  Widget build(BuildContext context) {
    var articles =
        posts.where((post) => post.category.contains(category)).toList();
    return CupertinoPageScaffold(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: const Text(
                    "News",
                  ),
                  trailing: Pressable(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: const Icon(
                      Icons.logout,
                      color: kACCENT_COLOR,
                    ),
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
                    child: category.isEmpty
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
                  child: !articles.isEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.all(15.0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PostCard(post: articles[index]);
                          },
                        )
                      : const Center(
                          child: Text(
                            "No articles in this category",
                            style: TextStyle(
                                color: kSECONDARY_TEXT_COLOR,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                )
              ],
            )));
  }
}
