import 'package:flutter/material.dart';

class StyleText extends StatefulWidget {
  final double width;
  final GestureTapCallback tappedText;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color backgrounColor;
  final TextDecoration textDecoration;
  final String fontFamily;

  const StyleText({
    Key key,
    this.text,
    this.padding,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.backgrounColor,
    this.textDecoration,
    this.tappedText,
    this.width,
    this.fontFamily,
  }) : super(key: key);

  @override
  _StyleTextState createState() => _StyleTextState();
}

class _StyleTextState extends State<StyleText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tappedText,
      child: Container(
        width: widget.width,
        padding: this.widget.padding ?? EdgeInsets.all(0),
        margin: this.widget.margin ?? EdgeInsets.all(0),
        child: Text(
          ('${this.widget.text ?? ''}'),
          textAlign: this.widget.textAlign ?? TextAlign.left,
          style: TextStyle(
            decoration: this.widget.textDecoration ?? TextDecoration.none,
            backgroundColor: widget.backgrounColor,
            fontWeight: this.widget.fontWeight ?? FontWeight.normal,
            color: this.widget.textColor ?? Colors.black,
            fontSize: this.widget.fontSize ?? 14.0,
          ),
        ),
      ),
    );
  }
}
