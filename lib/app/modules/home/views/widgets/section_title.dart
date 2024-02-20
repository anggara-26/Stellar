import 'package:flutter/material.dart';

class THomeSectionTitle extends StatelessWidget {
  const THomeSectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'sf-pro-display',
          fontWeight: FontWeight.w700,
          color: Color(0xFF999999),
        ),
      ),
    );
  }
}
