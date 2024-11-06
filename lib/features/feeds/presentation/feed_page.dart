import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../common/res/assets.dart';
import '../../../common/widget/profile_card.dart';

class FeedsPage extends StatefulHookConsumerWidget {
  const FeedsPage({super.key});

  @override
  ConsumerState<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends ConsumerState<FeedsPage> {
  // Swipe actions
  void _likeAction(BuildContext context, SwipeItem item) {/* Implementation */}
  void _nopeAction(BuildContext context, SwipeItem item) {/* Implementation */}
  void _superlikeAction(BuildContext context, SwipeItem item) {
    /* Implementation */
  }

  @override
  Widget build(BuildContext context) {
    final swipeItems = useState<List<SwipeItem>>([]);
    final matchEngine = useState<MatchEngine?>(null);

    useEffect(() {
      swipeItems.value = [
        SwipeItem(
          content: CardContent(
              img: PlaceholderAssets.demoImage4,
              title: "John Doe",
              description:
                  "Avid traveler and food lover with a passion for outdoor adventures.",
              hobbies: "Hiking, photography, and soccer",
              location: "New York, NY",
              bio:
                  "Passionate about connecting with people and exploring new places."),
          likeAction: () => _likeAction(context, swipeItems.value[0]),
          nopeAction: () => _nopeAction(context, swipeItems.value[0]),
          superlikeAction: () => _superlikeAction(context, swipeItems.value[0]),
        ),
        SwipeItem(
          content: CardContent(
              img: PlaceholderAssets.demoImage3,
              title: "Sarah Lee",
              description: "Animal lover and volunteer at local shelters.",
              hobbies: "Running, reading, and yoga",
              location: "San Francisco, CA",
              bio: "Committed to animal rights and self-improvement."),
          likeAction: () => _likeAction(context, swipeItems.value[1]),
          nopeAction: () => _nopeAction(context, swipeItems.value[1]),
          superlikeAction: () => _superlikeAction(context, swipeItems.value[1]),
        ),
        SwipeItem(
          content: CardContent(
              img: PlaceholderAssets.demoImage,
              title: "Michael Smith",
              description: "Tech enthusiast and aspiring entrepreneur.",
              hobbies: "Coding, basketball, and gaming",
              location: "Austin, TX",
              bio:
                  "Focused on building innovative solutions for everyday problems."),
          likeAction: () => _likeAction(context, swipeItems.value[2]),
          nopeAction: () => _nopeAction(context, swipeItems.value[2]),
          superlikeAction: () => _superlikeAction(context, swipeItems.value[2]),
        ),
        SwipeItem(
          content: CardContent(
              img: PlaceholderAssets.demoImage1,
              title: "Emily Johnson",
              description: "Art lover and museum aficionado.",
              hobbies: "Painting, traveling, and history",
              location: "Seattle, WA",
              bio: "Finding beauty in every corner of the world."),
          likeAction: () => _likeAction(context, swipeItems.value[3]),
          nopeAction: () => _nopeAction(context, swipeItems.value[3]),
          superlikeAction: () => _superlikeAction(context, swipeItems.value[3]),
        ),
        SwipeItem(
          content: CardContent(
              img: PlaceholderAssets.demoImage2,
              title: "David Brown",
              description: "Fitness enthusiast and certified personal trainer.",
              hobbies: "Weightlifting, hiking, and nutrition",
              location: "Chicago, IL",
              bio: "Helping people achieve their health and fitness goals."),
          likeAction: () => _likeAction(context, swipeItems.value[4]),
          nopeAction: () => _nopeAction(context, swipeItems.value[4]),
          superlikeAction: () => _superlikeAction(context, swipeItems.value[4]),
        ),
      ];

      matchEngine.value = MatchEngine(swipeItems: swipeItems.value);
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Discover"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Center(
            child: Text("No more profiles too bad 😂😂🙈"),
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: matchEngine.value != null
                      ? SwipeCards(
                          matchEngine: matchEngine.value!,
                          itemBuilder: (BuildContext context, int index) {
                            final cardContent =
                                swipeItems.value[index].content as CardContent;
                            return ProfileCard(
                              age: "21",
                              work: "Dentist",
                              school: "FUTA",
                              name: cardContent.title,
                              description: cardContent.description,
                              hobbies: cardContent.hobbies,
                              location: cardContent.location,
                              bio: cardContent.bio,
                              imagePath: cardContent
                                  .img, // Replace with actual image path or URL
                            );
                          },
                          onStackFinished: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("No more profiles")));
                          },
                          upSwipeAllowed: true,
                          fillSpace: true,
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () => matchEngine.value?.currentItem?.nope(),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.star, color: Colors.blue),
                      onPressed: () =>
                          matchEngine.value?.currentItem?.superLike(),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.favorite, color: Colors.green),
                      onPressed: () => matchEngine.value?.currentItem?.like(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Updated CardContent model to include additional profile details
class CardContent {
  final String img;
  final String title;
  final String description;
  final String hobbies;
  final String location;
  final String bio;

  CardContent({
    required this.img,
    required this.title,
    required this.description,
    required this.hobbies,
    required this.location,
    required this.bio,
  });
}
