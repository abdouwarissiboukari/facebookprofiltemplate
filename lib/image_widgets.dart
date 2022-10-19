import 'package:flutter/material.dart';

class profilImage extends StatelessWidget {
  late double radius;
  late String _url;
  late Color? color;

  profilImage({
    required this.radius,
    String? imageUrl,
    this.color,
  }){
    _url = imageUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color?? Colors.white,
      // foregroundImage: NetworkImage(url),
      radius: radius,
      child: CircleAvatar(
        foregroundImage: NetworkImage(_url),
        radius: radius-2,
      ),
    );
  }
}