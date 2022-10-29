import 'package:dexter/models/message_model.dart';
import 'package:dexter/theme/theme.dart';
import 'package:dexter/utils/status.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  final Message notification;
  final Function() onTapCallback;

  const NotificationTile(
      {super.key, required this.notification, required this.onTapCallback});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  Map<Enum, IconData> typePair = {
    MessageTypes.success: Icons.check_circle,
    MessageTypes.failure: Icons.cancel,
    MessageTypes.informative: Icons.info,
    MessageTypes.warning: Icons.warning_rounded,
  };

  @override
  Widget build(BuildContext context) {
    bool _value = widget.notification.sorted;

    return Column(
      children: [
        ListTile(
          tileColor: AppTheme.white,
          leading: CircleAvatar(
            backgroundColor: AppTheme.typeColor[widget.notification.type],
            child: Icon(
              typePair[widget.notification.type],
              color: AppTheme.white,
            ),
          ),
          title: Text(
            widget.notification.title,
            style: TextStyle(
              color: AppTheme.primary,
                decoration:
                    _value ? TextDecoration.lineThrough : TextDecoration.none),
  
          ),
          subtitle: Text(
            widget.notification.description,
            style: TextStyle(
                decoration:
                    _value ? TextDecoration.lineThrough : TextDecoration.none),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(16.0),
            child: Checkbox(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value!;
                });
              },
            ), //,
          ),
        ),
        const Divider()
      ],
    );
  }
}
