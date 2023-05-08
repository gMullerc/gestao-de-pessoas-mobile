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
      height: 235,
      width: 150,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
