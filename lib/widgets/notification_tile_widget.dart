import 'package:dexter/models/notification_model.dart';
import 'package:dexter/providers/notifications_provider.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:provider/provider.dart';

class NotificationTile extends StatelessWidget {
  AppNotification notification;
  NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    var notificationProvider = Provider.of<NotificationsProvider>(context);
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppTheme.light,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        onTap: () {
          showPlatformDialog(
            context: context,
            builder: (context) => BasicDialogAlert(
              title: Text(
                notification.title,
                style: const TextStyle(color: AppTheme.secondary),
              ),
              content: Text(notification.body),
              actions: <Widget>[
                BasicDialogAction(
                  title: const Text(
                    "OK",
                    style: TextStyle(color: AppTheme.secondary, fontSize: 18),
                  ),
                  onPressed: () async {
                    // Make notification read
                    await AppService()
                        .readNotification(data: {"id": notification.id});
                    notificationProvider.refresh();
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
              width: 16,
              height: 16,
              padding: const EdgeInsets.all(0.5),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.secondary,
              ),
              child: CircleAvatar(
                backgroundColor:
                    notification.read ? AppTheme.white : AppTheme.secondary,
              ),
            ),
          ],
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
              color: AppTheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          notification.body,
          maxLines: 2,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        trailing: InkWell(
          onTap: () {
            // App service call delete notification
            AppService().deleteNotification(data: {"id": notification.id});
            notificationProvider.refresh();
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
