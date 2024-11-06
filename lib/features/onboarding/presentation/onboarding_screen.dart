import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:opensocial/common/res/assets.dart';
import 'package:opensocial/common/widget/custom_buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  PlaceholderAssets
                      .couple, // Replace with your image asset path
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            color:
                Colors.black.withOpacity(0.6), // Adjust the opacity as needed
          ),
          // Content on top of the overlay
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(150),
                  const Text(
                    'Bumble',
                    style: TextStyle(
                      fontSize: 31,
                      color: Color(0xFFFEC627),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    'MAKE THE\nFIRST MOVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xFFFEC627),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(200),
                  CustomFullButton(
                    textColor: Colors.black,
                    text: "Register",
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  Gap(12),
                  CustomFullButton(
                    textColor: Color(0xFFFEC627),
                    text: "Login",
                    onPressed: () {},
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
