import 'package:dexter/models/notification_model.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class NotificationTile extends StatelessWidget {
  AppNotification notification;
  NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppTheme.gradient,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        onTap: () {
          showPlatformDialog(
            context: context,
            builder: (context) => BasicDialogAlert(
              title: Text(
                notification.title,
                style: const TextStyle(color: AppTheme.primary),
              ),
              content: Text(notification.body),
              actions: <Widget>[
                BasicDialogAction(
                  title: const Text(
                    "OK",
                    style: TextStyle(color: AppTheme.primary, fontSize: 18),
                  ),
                  onPressed: () async {
                    // Make notification read
                    await AppService().readNotification(notification.id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
        isThreeLine: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 14,
              height: 14,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    notification.read ? AppTheme.secondary : AppTheme.primary,
              ),
            ),
          ],
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.body,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        trailing: InkWell(
          onTap: () {
            // App service call delete notification
            AppService().deleteNotification(notification.id);
          },
          child: const Icon(
            Icons.remove_circle,
            color: AppTheme.danger,
          ),
        ),
      ),
    );
  }
}
