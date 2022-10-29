import 'package:dexter/models/message_model.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/foundation.dart';

class MessageProvider with ChangeNotifier {
  MessageProvider._();
  static final instance = MessageProvider._();

  List<Message> message = [];
  LoadingStatus status = LoadingStatus.unknown;

  void loadingStatusChanged(LoadingStatus status) {
    this.status = status;
    notifyListeners();
  }

  void updateMessages({required List<Message> message}) {
    this.message = message;
    status = LoadingStatus.loadingSuccess;
    notifyListeners();
  }
}
