import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swipe_cards/swipe_cards.dart';

class RequestFeeds extends StatefulHookConsumerWidget {
  const RequestFeeds({super.key});

  @override
  ConsumerState<RequestFeeds> createState() => _RequestFeedsState();
}

class _RequestFeedsState extends ConsumerState<RequestFeeds> {
  void _approveAction(BuildContext context, SwipeItem item) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("You approved ${item.content.title}")),
    // );
  }

  void _declineAction(BuildContext context, SwipeItem item) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("You declined ${item.content.title}")),
    // );
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
          likeAction: () => _approveAction(
              context, swipeItems.value[cardData.indexOf(content)]),
          nopeAction: () => _declineAction(
              context, swipeItems.value[cardData.indexOf(content)]),
        );
      }).toList();

      matchEngine.value = MatchEngine(swipeItems: swipeItems.value);

      return null; // No cleanup needed here
    }, []); // Empty dependency array to run only once

    return Scaffold(
      appBar: AppBar(
        title: const Text("Requests"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 16.0,
          bottom: 100,
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
                  ElevatedButton.icon(
                    onPressed: () {
                      matchEngine.value?.currentItem?.nope();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Decline"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      matchEngine.value?.currentItem?.like();
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Apply"),
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
