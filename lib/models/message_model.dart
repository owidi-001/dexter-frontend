import 'package:dexter/utils/status.dart';

class Message {
  int id;
  String title;
  String description;
  bool sorted;
  String time;
  MessageTypes type; // Success, failure, informative, warning

  Message(
      {required this.id,
      required this.title,
      required this.description,
      required this.sorted,
      required this.time,
      required this.type});

  static List<Message> notifications = [
    Message(
        id: 1,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 2,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    Message(
        id: 3,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    Message(
        id: 4,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 5,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.failure),
    Message(
        id: 6,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 7,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    Message(
        id: 8,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    Message(
        id: 1,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 2,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    Message(
        id: 3,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
    Message(
        id: 4,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 5,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.failure),
    Message(
        id: 6,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.warning),
    Message(
        id: 7,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: false,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.success),
    Message(
        id: 8,
        title: "Restock boots",
        description: "You have only 4 boots remaining",
        sorted: true,
        time: "Sep 2/22 1000hrs",
        type: MessageTypes.informative),
  ];
}
