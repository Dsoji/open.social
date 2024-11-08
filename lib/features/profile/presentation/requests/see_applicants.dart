import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swipe_cards/swipe_cards.dart';

class ApplicantsPage extends StatefulHookConsumerWidget {
  const ApplicantsPage({super.key});

  @override
  ConsumerState<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends ConsumerState<ApplicantsPage> {
  void _likeAction(BuildContext context, SwipeItem item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You liked ${item.content.title}")),
    );
  }

  void _nopeAction(BuildContext context, SwipeItem item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You disliked ${item.content.title}")),
    );
  }

  void _superlikeAction(BuildContext context, SwipeItem item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You superliked ${item.content.title}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize swipeItems and MatchEngine using hooks
    final swipeItems = useState<List<SwipeItem>>([]);
    final matchEngine = useState<MatchEngine?>(null);

    useEffect(() {
      // Define card data
      final cardData = [
        CardContent(
            title: "Applicant 1", description: "This is the first applicant."),
        CardContent(
            title: "Applicant 2", description: "This is the second applicant."),
        CardContent(
            title: "Applicant 3", description: "This is the third applicant."),
        CardContent(
            title: "Applicant 4", description: "This is the fourth applicant."),
        // Add more applicants as needed
      ];

      // Generate SwipeItems using a loop
      swipeItems.value = cardData.map((content) {
        return SwipeItem(
          content: content,
          likeAction: () =>
              _likeAction(context, swipeItems.value[cardData.indexOf(content)]),
          nopeAction: () =>
              _nopeAction(context, swipeItems.value[cardData.indexOf(content)]),
          superlikeAction: () => _superlikeAction(
              context, swipeItems.value[cardData.indexOf(content)]),
        );
      }).toList();

      matchEngine.value = MatchEngine(swipeItems: swipeItems.value);

      return null; // No cleanup needed here
    }, []); // Empty dependency array to run only once

    return Scaffold(
      appBar: AppBar(
        title: const Text("Applicants"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 16.0,
          bottom: 70,
        ),
        child: Column(
          children: [
            Expanded(
              child: matchEngine.value != null
                  ? SwipeCards(
                      matchEngine: matchEngine.value!,
                      itemBuilder: (BuildContext context, int index) {
                        final cardContent =
                            swipeItems.value[index].content as CardContent;
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cardContent.title,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    cardContent.description,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      onStackFinished: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No more applicants")),
                        );
                      },
                      itemChanged: (SwipeItem item, int index) {
                        // print("Applicant at index: $index has been swiped.");
                      },
                      upSwipeAllowed: true,
                      fillSpace: true,
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      matchEngine.value?.currentItem?.nope();
                    },
                    child: const Text("Dislike"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      matchEngine.value?.currentItem?.superLike();
                    },
                    child: const Text("Superlike"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      matchEngine.value?.currentItem?.like();
                    },
                    child: const Text("Like"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent {
  final String title;
  final String description;

  CardContent({required this.title, required this.description});
}
