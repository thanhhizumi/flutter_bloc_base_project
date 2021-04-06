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
      height: this.buttonHeight ?? 32,
      width: this.buttonWidth ?? 32,
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: this.backgroundColor ?? Colors.white,
            side: BorderSide(color: this.borderColor ?? Colors.transparent),
            shape: BeveledRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(this.radius ?? 0.0))),
          ),
          onPressed: this.buttonTapped,
          child: Text(
            '${this.title ?? ''}',
            style: TextStyle(
              fontSize: this.titleFontSize ?? 14,
              color: this.titleColor ?? Colors.black,
              fontWeight: this.titleFontWeight ?? FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
