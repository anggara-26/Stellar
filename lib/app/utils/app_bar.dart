import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar/app/controllers/auth_controller.dart';
import 'package:stellar/app/utils/colors.dart';
import 'package:stellar/app/utils/decorations.dart';
import 'package:stellar/app/utils/dialog.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({required this.authC, super.key});
  final AuthController authC;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.settings_outlined,
        'text': 'Pengaturan',
        'onClick': () {
          TUnderDevelopmentAlertDialog.show('Pengaturan');
        }
      },
      {
        'icon': Icons.home,
        'text': 'Bantuan',
        'onClick': () {
          TUnderDevelopmentAlertDialog.show('Bantuan');
        }
      },
      {
        'icon': Icons.info_outline,
        'text': 'FAQ',
        'onClick': () {
          TUnderDevelopmentAlertDialog.show('FAQ');
        }
      },
      {
        'icon': Icons.logout_outlined,
        'text': 'Keluar',
        'onClick': authC.logout
      },
    ];
    return AppBar(
      title: const Text(
        'Stellar',
        style: TextStyle(
          fontFamily: 'sf-pro-display',
          color: TColors.textBodyColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TopDrawerContent(menuItems: menuItems),
          );
        },
        icon: const Icon(Icons.menu_outlined),
      ),
      actions: [
        IconButton(
          onPressed: () => TUnderDevelopmentAlertDialog.show('Notifikasi'),
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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
