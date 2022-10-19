import 'package:flutter/material.dart';
import 'package:profiltemplate/text_widgets.dart';

class buttonContainer extends StatelessWidget{
  late Size size;
  late IconData? icon;
  late String? text;

  buttonContainer({required this.size, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 40,
      // width: size.width/1.27,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: (text != null)
          ? Center(
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            SimpleText(text: text ?? "", color: Colors.white, fontsize: 14, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, nbrLines: 1),
          ],
        ),
      )
          : Center(
        child: Icon(icon, color: Colors.white,),),
    );
  }
}