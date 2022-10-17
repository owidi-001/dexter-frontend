import 'package:dexter/utils/status.dart';

class NotificationMessage {
  int id;
  String title;
  String description;
  bool sorted;
  String time;
  MessageTypes type; // Success, failure, informative, warning

  NotificationMessage(
      {required this.id,
      required this.title,
      required this.description,
      required this.sorted,
      required this.time,
      required this.type});

  static List<NotificationMessage> notifications = [
    NotificationMessage(
        id: 1,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 2,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    NotificationMessage(
        id: 3,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    NotificationMessage(
        id: 4,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 5,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.failure),
    NotificationMessage(
        id: 6,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 7,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    NotificationMessage(
        id: 8,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    NotificationMessage(
        id: 1,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 2,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    NotificationMessage(
        id: 3,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    NotificationMessage(
        id: 4,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 5,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.failure),
    NotificationMessage(
        id: 6,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    NotificationMessage(
        id: 7,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    NotificationMessage(
        id: 8,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
  ];
}
