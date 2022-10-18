
import 'package:flutter/material.dart';

class SimpleText extends Text{
  late String text;
  Color? color;
  double? fontsize;
  late FontWeight fontWeight;
  FontStyle? fontStyle;
  int? nbrLines;
  TextAlign? textAligns;

  SimpleText({
    required this.text,
    this.color,
    this.fontsize,
    required this.fontWeight,
    this.fontStyle,
    this.nbrLines,
    this.textAligns,
  }) : super(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    ),
    textAlign: textAligns?? TextAlign.center,
    maxLines: nbrLines,
  );
}