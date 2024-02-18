import 'package:flutter/material.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeBanner extends StatelessWidget {
  const THomeBanner({
    required this.onPressed,
    required this.backgroundImage,
    required this.icon,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final ImageProvider backgroundImage;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 14.0,
            ),
            fixedSize: const Size(double.infinity, double.infinity),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: Row(children: [
            Icon(
              icon,
              size: 20.0,
              color: TColors.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'sf-pro-display',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
