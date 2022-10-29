import 'package:dexter/models/message_model.dart';
import 'package:dexter/screens/notifications/components/notification_tile.dart';
import 'package:dexter/screens/notifications/components/notification_top_widget.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  List<Message> notifications = Message.notifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 32,
          ),
          // Top widgets
          NotificationTopWidget(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              decoration: const BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: const TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Filter Products",
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: AppTheme.secondary,
                      fontWeight: FontWeight.w500),
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: notifications.length,
                itemBuilder: (context, index) => NotificationTile(
                    notification: notifications[index], onTapCallback: () {})),
          ),
        ],
      ),
    );
  }
}
