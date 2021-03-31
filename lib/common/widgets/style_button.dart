import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  final VoidCallback buttonTapped;
  final double buttonHeight;
  final double buttonWidth;
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double radius;
  final Color borderColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String fontFamily;

  const StyleButton({
    Key key,
    this.buttonTapped,
    this.backgroundColor,
    this.title,
    this.radius,
    this.borderColor,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.buttonHeight,
    this.buttonWidth,
    this.padding,
    this.margin,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin ?? EdgeInsets.all(0),
      padding: this.padding ?? EdgeInsets.all(0),
      child: FlatButton(
        height: this.buttonHeight ?? 32,
        minWidth: this.buttonWidth ?? 40,
        onPressed: this.buttonTapped,
        child: Text(
          '${this.title ?? ''}',
          style: TextStyle(
            fontSize: this.titleFontSize ?? 14,
            color: this.titleColor ?? Colors.black,
            fontWeight: this.titleFontWeight ?? FontWeight.normal,
          ),
        ),
        color: this.backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.radius ?? 0.0),
            side: BorderSide(color: this.borderColor ?? Colors.transparent)),
      ),
    );
  }
}
