class AppNotification {
  int id;
  String title;
  String body;
  String timeModified;
  bool read;

  AppNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.timeModified,
      required this.read});

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        timeModified: json["timeModified"],
        read: json["read"]);
  }

  factory AppNotification.empty() {
    return AppNotification(
        id: -1,
        title: "title",
        body: "The quick brown fox",
        timeModified: "timeModified",
        read: true);
  }

  Map<String, dynamic> toMap(AppNotification notification) {
    Map<String, dynamic> data = {
      "id": notification.id,
      "title": notification.title,
      "body": notification.body,
      "timeModified": notification.timeModified,
      "read": notification.read
    };
    return data;
  }
}
