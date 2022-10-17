import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:dexter/screens/home/home.dart';
import 'package:dexter/screens/new/new.dart';
import 'package:dexter/screens/notifications/notifications.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedPos = 0;

  late CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.dashboard_rounded, "Dashboard", AppTheme.primary,
        labelStyle: const TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w400,
            fontSize: 12)),
    TabItem(Icons.add_box_rounded, "New", AppTheme.primary,
        labelStyle: const TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w400,
            fontSize: 12)),
    TabItem(Icons.notifications, "Notifications", AppTheme.primary,
        labelStyle: const TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w400,
            fontSize: 12)),
  ]);

  @override
  void initState() {
    super.initState();
    selectedPos = 0;
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      selectedPos: 0,
      normalIconColor: Colors.grey,
      selectedIconColor: AppTheme.white,
      circleStrokeWidth: 0,
      controller: _navigationController,
      barHeight: 50,
      circleSize: 50,
      iconsSize: 24,
      barBackgroundColor: AppTheme.white,
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (selectedPos) => setState(
        () {
          this.selectedPos = selectedPos!;
        },
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return HomeScreen();
      case 1:
        return NewScreen();
      case 2:
        return NotificationsScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                color: const Color(0xffe8f2fc),
                child: bodyContainer(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
