import 'package:flutter/material.dart';
import 'package:profiltemplate/text_widgets.dart';

class aboutRow extends StatelessWidget {
  late IconData icon;
  late String text;

  aboutRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        SimpleText(
            text: text,
            color: Colors.black,
            fontsize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            nbrLines: 1
        ),
      ],
    );
  }
}