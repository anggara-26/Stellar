import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeDisplayName extends StatelessWidget {
  const THomeDisplayName(this.name, {super.key});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        name != null ? 'Halo, $name!' : 'Halo!',
        style: Get.textTheme.titleSmall,
      ),
    );
  }
}
