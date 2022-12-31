import 'package:dexter/models/user_model.dart';
import 'package:dexter/providers/auth_provider.dart';
import 'package:dexter/providers/notifications_provider.dart';
import 'package:dexter/screens/auth/login.dart';
import 'package:dexter/screens/profile/pages/all_products.dart';
import 'package:dexter/screens/profile/pages/help_web_view.dart';
import 'package:dexter/screens/profile/pages/notifications.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/show_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<AuthenticationProvider>(context);
    User user = userProvider.user;

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
              Text(
                user.email,
                style: const TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                user.phoneNumber,
                style: const TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
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
              user.isStaff
                  ? InkWell(
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
                    )
                  : Container(),
              user.isStaff
                  ? InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const Notifications()),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.only(
                            top: 18.0, bottom: 18.0, right: 16.0),
                        decoration: BoxDecoration(
                            color: AppTheme.gradient,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            NotificationIcon(),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(color: AppTheme.primary),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
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
              InkWell(
                onTap: () {
                  showPlatformDialog(
                    context: context,
                    builder: (context) => BasicDialogAlert(
                      title: const Text(
                        "Logout confirmation",
                        style: TextStyle(color: AppTheme.primary),
                      ),
                      content: const Text(
                          "Confirm the action to clear login details from the app?"),
                      actions: <Widget>[
                        BasicDialogAction(
                          title: const Text(
                            "Logout",
                            style: TextStyle(
                                color: AppTheme.primary, fontSize: 18),
                          ),
                          onPressed: () async {
                            // Make notification read
                            userProvider.logout();
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackMessage(true, "User logged out!"));
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginScreen())));
                          },
                        ),
                        BasicDialogAction(
                          title: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: AppTheme.primary, fontSize: 18),
                          ),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackMessage(true, "Logout cancelled!"));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
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
                        Icons.logout,
                        color: AppTheme.primary,
                        size: 28,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: AppTheme.primary),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
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
