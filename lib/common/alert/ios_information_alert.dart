import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosInformationAlert extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final String description;
  final String buttonTitleText;

  const IosInformationAlert({
    Key key,
    this.title,
    this.description,
    this.buttonTitleText,
    this.onPressed,
  }) : super(key: key);

  @override
  _IosAlertState createState() => _IosAlertState();
}

class _IosAlertState extends State<IosInformationAlert> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      insetAnimationDuration: Duration(seconds: 1),
      title: Text('${this.widget.title}'),
      content: Text('${this.widget.description}'),
      actions: [
        CupertinoDialogAction(
          child: Text('${this.widget.buttonTitleText}'),
          onPressed: widget.onPressed,
        )
      ],
    );
  }
}
