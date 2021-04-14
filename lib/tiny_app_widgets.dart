import 'package:flutter/material.dart';

class TinyAppWidgets {
  final ThemeData theme;
  final defaultFontSize = 14.0;
  final btnPadding = 16.0;
  TinyAppWidgets({required this.theme});

  Widget sizedButton(
    String text, {
    double? fontSize,
    Color? color,
    VoidCallback? onPressed,
  }) {
    final theFontSize = fontSize ?? defaultFontSize;
    final theColor = color ?? theme.primaryColor;
    final padding = (btnPadding / defaultFontSize) * theFontSize;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: theColor,
        minimumSize: Size(0, (36.0 / defaultFontSize) * theFontSize),
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: 0.0,
        ),
        textStyle: TextStyle(
          fontSize: theFontSize,
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Text(text),
    );
  }
}
