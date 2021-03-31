import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosOptionsAlert extends StatefulWidget {
  final VoidCallback onPressedAgree;
  final String title;
  final String description;

  const IosOptionsAlert({
    Key key,
    this.title,
    this.description,
    this.onPressedAgree,
  }) : super(key: key);
  @override
  _IosOptionsAlertState createState() => _IosOptionsAlertState();
}

class _IosOptionsAlertState extends State<IosOptionsAlert> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      insetAnimationDuration: Duration(seconds: 1),
      title: Text('${this.widget.title}'),
      content: Text('${this.widget.description}'),
      actions: [
        CupertinoDialogAction(
          child: Text('Đồng ý'),
          onPressed: widget.onPressedAgree,
        ),
        CupertinoDialogAction(
          child: Text('Huỷ bỏ'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
