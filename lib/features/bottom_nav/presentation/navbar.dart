import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:opensocial/features/bottom_nav/presentation/bottom_nav.dart';

import '../../feeds/presentation/feed_page.dart';
import '../../messages/presentation/messages.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../request_feed/presentation/request_feed.dart';

class NaviBar extends StatefulWidget {
  final int index;
  const NaviBar({
    super.key,
    this.index = 1,
  });

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  List<Widget> pageList = [
    const FeedsPage(),
    const RequestFeeds(),
    const Messages(),
    ProfileScreen(),
  ];

  late int pageIndex;

  @override
  void initState() {
    super.initState();
    // requestStoragePermission();
    pageIndex = widget.index;
  }
  //   //notificaiton
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //         id: 10,
  //         channelKey: 'high_importance_channel',
  //         title: message.notification?.title ?? 'No Title',
  //         body: message.notification?.body ?? 'No Body',
  //         notificationLayout: NotificationLayout.Default,
  //       ),
  //     );
  //   });

  //   // Handle app opened by notification
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was published!');
  //     // Handle the navigation or other logic here
  //   });
  // }

  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  // void requestStoragePermission() async {
  //   // Check if the platform is not web, as web has no permissions
  //   if (!kIsWeb) {
  //     // Request storage permission
  //     var status = await Permission.storage.status;
  //     if (!status.isGranted) {
  //       await Permission.storage.request();
  //     }

  //     // Request camera permission
  //     var cameraStatus = await Permission.camera.status;
  //     if (!cameraStatus.isGranted) {
  //       await Permission.camera.request();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      extendBody: true,
      body: pageList[pageIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 64,
        elevation: 0,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNav(
              index: 0,
              onTap: () {
                changePage(0);
              },
              icon: HugeIcons.strokeRoundedScroll,
              label: 'Feeds',
              color:
                  pageIndex == 0 ? Theme.of(context).primaryColor : Colors.grey,
            ),
            BottomNav(
              index: 1,
              onTap: () {
                changePage(1);
              },
              icon: HugeIcons.strokeRoundedMouseScroll02,
              label: 'Requests',
              color:
                  pageIndex == 1 ? Theme.of(context).primaryColor : Colors.grey,
            ),
            BottomNav(
              index: 2,
              onTap: () {
                changePage(2);
              },
              icon: HugeIcons.strokeRoundedAiChat01,
              label: 'Messages',
              color:
                  pageIndex == 2 ? Theme.of(context).primaryColor : Colors.grey,
            ),
            BottomNav(
              index: 3,
              onTap: () {
                changePage(3);
              },
              icon: HugeIcons.strokeRoundedUser,
              label: 'Profile',
              color:
                  pageIndex == 3 ? Theme.of(context).primaryColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
