import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:opensocial/common/res/assets.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String age;
  final String description;
  final String hobbies;
  final String location;
  final String bio;
  final String imagePath;
  final String work;
  final String school;

  ProfileCard({
    super.key,
    required this.name,
    required this.description,
    required this.hobbies,
    required this.location,
    required this.bio,
    required this.imagePath,
    required this.age,
    required this.work,
    required this.school,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.white],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 723,
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$name, $age",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "💼 $work",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "🎓 $school",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFFFEC627),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                              ),
                            ),
                          ),
                          const Gap(50),
                        ],
                      ),
                    ),
                  ),
                  aboutMeSection(),
                  inSearchFor(),
                  myInterests(),
                  imageWidget(
                    PlaceholderAssets.demoImage1,
                  ),
                  myLanguages(),
                  imageWidget(
                    PlaceholderAssets.demoImage2,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📍 My location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(12),
                        Text(
                          "Ikeja",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "5 km away",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 30,
              right: 12,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFFEC627),
                child: Center(
                  child: Icon(
                    Icons.star,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget(String image) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  final List<String> aboutMeItems = [
    '📏 155 cm',
    '🍻 Sometimes',
    '🎓 Postgraduate degree',
    '💁🏼‍♀️ Woman',
    '🧑‍🧑‍🧒‍🧒 Open to kids',
    '🔯 Pisces',
    '🙏 Christian'
  ];

  final List<String> searchingItems = [
    'long term',
    'fun, casual dates',
  ];

  final List<String> interestsItems = [
    '🧘🏼‍♂️ Yoga',
    '🏛️ Musuems & galleries',
    '📺 Horror',
    '🎶 R&B',
    '🍷 Wine',
  ];

  final List<String> languageItems = [
    '💬 English',
    '💬 Youruba',
  ];

  Widget aboutMeSection() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About me',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: aboutMeItems
                .map((item) => Chip(
                      side: BorderSide.none,
                      backgroundColor: const Color(0xFFF1F0F0),
                      label: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget inSearchFor() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "I'm looking for",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: const Color(0xFFF1F0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: searchingItems
                  .map((item) => Chip(
                        backgroundColor: const Color(0xFFF6F4F4),
                        label: Text(
                          "⭐️ $item",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget myInterests() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My interests",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: interestsItems
                .map((item) => Chip(
                      side: BorderSide.none,
                      backgroundColor: const Color(0xFFF1F0F0),
                      label: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget myLanguages() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My interests",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: languageItems
                .map((item) => Chip(
                      side: BorderSide.none,
                      backgroundColor: const Color(0xFFF1F0F0),
                      label: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
