import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_base_project/common/alert/ios_information_alert.dart';
import 'package:flutter_bloc_base_project/common/alert/ios_options_alert.dart';
import 'dart:io' show Platform;

class PageMixin {
  showAlertOptionsDialog(BuildContext context, String title, String message,
      VoidCallback onPressedAgree) {
    showCupertinoDialog(
        context: context,
        builder: (context) => IosOptionsAlert(
              title: '$title',
              description: '$message',
              onPressedAgree: onPressedAgree ??
                  () {
                    Navigator.pop(context);
                  },
            ));
  }

  showAlertDialog(BuildContext context, String title, String message,
      String buttonTitle, VoidCallback onPressed) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) => IosInformationAlert(
                title: '$title',
                description: '$message',
                buttonTitleText: '$buttonTitle',
                onPressed: onPressed ??
                    () {
                      Navigator.pop(context);
                    },
              ));
    } else {
      // set up the buttons
      Widget okButton = FlatButton(
        child: Text(buttonTitle),
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  dissmissLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  showLoading(BuildContext context) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ));
      },
    );
  }
}
