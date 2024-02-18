import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/utils/colors.dart';
import 'package:stellar/app/utils/decorations.dart';

class TopDrawerContent extends StatefulWidget {
  const TopDrawerContent({required this.menuItems, super.key});

  final List<Map<String, dynamic>> menuItems;

  @override
  _TopDrawerContentState createState() => _TopDrawerContentState();
}

class _TopDrawerContentState extends State<TopDrawerContent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    slideAnimation = Tween<Offset>(
            begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () => Get.back(),
            icon: Icon(Icons.cancel_outlined,
                color: Get.theme.primaryColor, size: 32),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(13.0),
          height: MediaQuery.of(context).size.height / 3.6,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 44.0),
            child: ListView.builder(
                itemCount: widget.menuItems.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: widget.menuItems[index]['onClick'],
                    style: TDecorations.textButtonDecoration,
                    child: Row(
                      children: [
                        Icon(
                          widget.menuItems[index]['icon'],
                          size: 32,
                          color: TColors.primaryColor,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          widget.menuItems[index]['text'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

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
