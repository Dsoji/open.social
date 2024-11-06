import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:opensocial/features/profile/presentation/requests/requests_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "Bella Abdul";
  final String userEmail = "@bellaud85";
  final String profilePictureUrl =
      "https://i.pravatar.cc/150?img=3"; // Replace with actual image URL
  final String userStatus = "Certified Member"; // Example user status
  final List<String> userInterests = ["Traveling", "Photography", "Technology"];

  ProfileScreen({super.key}); // User interests

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Picture with a Badge
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(profilePictureUrl),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // User Name
                  Text(
                    userName,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),

                  // User Email
                  Text(
                    userEmail,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  // User Status Badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            color: Colors.blueAccent, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          userStatus,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Interests Section
                  Wrap(
                    spacing: 8,
                    children: userInterests.map((interest) {
                      return Chip(
                        label: Text(interest),
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        labelStyle: const TextStyle(color: Colors.blueAccent),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  // New Update Badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Settings Options Section
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedMusicNoteSquare01,
                  title: "Requests",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateRequestsScreen(),
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedWallet01,
                  title: "Transaction Settings",
                  onTap: () {
                    // Navigate to Transaction Settings
                  },
                ),
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedNotification02,
                  title: "Notification Settings",
                  onTap: () {
                    // Navigate to Notification Settings
                  },
                ),
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedFerrisWheel,
                  title: "Referral System",
                  onTap: () {
                    // Navigate to Referral System
                  },
                ),
                // _buildProfileOption(
                //   icon: Icons.leaderboard,
                //   title: "Leaderboard",
                //   onTap: () {
                //     // Navigate to Leaderboard
                //   },
                // ),
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedHelpCircle,
                  title: "Help & Support",
                  onTap: () {
                    // Navigate to Help & Support
                  },
                ),
                const Divider(),
                _buildProfileOption(
                  icon: HugeIcons.strokeRoundedLogout01,
                  title: "Logout",
                  onTap: () {
                    // Log out the user
                  },
                  iconColor: Colors.red,
                ),
              ],
            ),

            // App Version Info
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "App Version 1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: "Transactions"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Account"),
        ],
        currentIndex: 3, // Set to the "Account" tab
        selectedItemColor: Colors.purple,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return ListTile(
      leading: HugeIcon(
        size: 24,
        icon: icon,
        color: iconColor,
      ),
      title: Text(title),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
