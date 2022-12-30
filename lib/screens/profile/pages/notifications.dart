import 'package:dexter/providers/notifications_provider.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/widgets/notification_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var notificationsProvider = Provider.of<NotificationsProvider>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppTheme.primary,
          title: const Text(
            "Notifications",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Playfair',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            InkWell(
                onTap: (() {
                  // make all notifications read/openned
                  for (var notification in notificationsProvider.items) {
                    AppService()
                        .readNotification(data: {"id": notification.id});
                  }
                  notificationsProvider.refresh();
                }),
                child: const CircleAvatar(
                    backgroundColor: AppTheme.gradient,
                    child: Icon(
                      CupertinoIcons.envelope_open_fill,
                      color: AppTheme.primary,
                    ))),
            const SizedBox(
              width: 18,
            )
          ]),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            notificationsProvider.refresh();
          });
        },
        child: notificationsProvider.items.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: notificationsProvider.items.length,
                itemBuilder: ((context, index) => NotificationTile(
                      notification: notificationsProvider.items[index],
                    )),
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppTheme.gradient,
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Center(
                  child: Text(
                    "No notifications yet!",
                    style: TextStyle(color: AppTheme.primary, fontSize: 20),
                  ),
                ),
              ),
      ),
    );
  }
}
