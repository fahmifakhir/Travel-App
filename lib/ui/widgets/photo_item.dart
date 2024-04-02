import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class PhotoItems extends StatelessWidget {
  final String imageUrl;
  const PhotoItems({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
