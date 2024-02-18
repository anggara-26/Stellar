import 'package:flutter/material.dart';
import 'package:stellar/app/utils/colors.dart';

class THomeHighlightList extends StatelessWidget {
  const THomeHighlightList(this.data, {super.key});

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      itemBuilder: (context, index) {
        return THomeHighlighBox(
          onPressed: () {},
          backgroundImage: data[index]['imageUrl'] ?? '',
          text: data[index]['text'] ?? '',
        );
      },
    );
  }
}

class THomeHighlighBox extends StatelessWidget {
  const THomeHighlighBox({
    required this.onPressed,
    required this.backgroundImage,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String backgroundImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.bottomCenter,
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
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'sf-pro-display',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              size: 32.0,
              color: TColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
