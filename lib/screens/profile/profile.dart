import 'package:dexter/providers/cart_provider.dart';
import 'package:dexter/providers/notifications_provider.dart';
import 'package:dexter/screens/profile/pages/all_products.dart';
import 'package:dexter/screens/profile/pages/help_web_view.dart';
import 'package:dexter/screens/profile/pages/notifications.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.primary,
          title: const Text(
            "Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: const [
            // InkWell(
            //     onTap: (() {
            //       // _showForm(null);
            //     }),
            //     child: const CircleAvatar(
            //         backgroundColor: AppTheme.gradient,
            //         child: Icon(
            //           CupertinoIcons.add_circled_solid,
            //           color: AppTheme.primary,
            //         ))),
            SizedBox(
              width: 18,
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Business",
                    style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundColor: AppTheme.primary,
                  radius: 48,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Image(image: AssetImage("assets/images/user.png")),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Text(
                "user@mail.com",
                style: TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AllProducts()))),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: AppTheme.gradient,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person,
                        color: AppTheme.primary,
                        size: 28,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "My Account",
                        style: TextStyle(color: AppTheme.primary),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const AllProducts()),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: AppTheme.gradient,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.dashboard_customize_rounded,
                        color: AppTheme.primary,
                        size: 28,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "My Products",
                        style: TextStyle(color: AppTheme.primary),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Notifications()),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: AppTheme.gradient,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // Icon(
                      //   Icons.notifications,
                      //   color: AppTheme.primary,
                      //   size: 28,
                      // ),
                      NotificationIcon(),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(color: AppTheme.primary),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HelpPage()),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: AppTheme.gradient,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.help_center_rounded,
                        color: AppTheme.primary,
                        size: 28,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "Help",
                        style: TextStyle(color: AppTheme.primary),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// build notification icon

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<NotificationsProvider>(context);
    return SizedBox(
      width: kToolbarHeight,
      child: Stack(
        // alignment: Alignment.centerLeft,
        fit: StackFit.passthrough,
        children: [
          const Icon(
            Icons.notifications,
            color: AppTheme.primary,
            size: 28,
          ),
          Positioned(
            top: 0,
            right: 8,
            child: Container(
              width: 18,
              height: 18,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.secondary,
              ),
              child: Center(
                child: Text(
                  "${cartProvider.items.length}",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
