import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        width: 90,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 155,
          child: Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image))),
          ),
        ));
  }
}
