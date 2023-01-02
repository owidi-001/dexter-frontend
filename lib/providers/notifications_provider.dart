import 'dart:collection';

import 'package:dexter/models/notification_model.dart';
import 'package:dexter/services/app_service.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class NotificationsProvider extends ChangeNotifier {
  List<AppNotification> _items = [];
  LoadingStatus status = LoadingStatus.unknown;

  UnmodifiableListView<AppNotification> get items =>
      UnmodifiableListView(_items);

  // Constructor
  NotificationsProvider() {
    status = LoadingStatus.unknown;
    _initFetch();
  }

  setNotifications(List<AppNotification> notifications) {
    _items = notifications;
    notifyListeners();
  }

  // fetch notifications
  Future<void> _initFetch() async {
    final res = await AppService().fetchNotifications();

    // if (kDebugMode) {
    //   print(res);
    // }

    res.when(error: (error) {
      status = LoadingStatus.loadingFailure;
    }, success: (data) {
      // if (kDebugMode) {
      //   print(data);
      // }
      setNotifications(data);
      status = LoadingStatus.loadingSuccess;
    });

    notifyListeners();
  }

  // count Unread
  int countUnread() {
    int num = 0;
    for (var element in items) {
      if (!element.read) {
        num += 1;
      }
    }
    return num;
  }

  // Get new notifications
  void refresh() async {
    await _initFetch();
    notifyListeners();
  }
}
