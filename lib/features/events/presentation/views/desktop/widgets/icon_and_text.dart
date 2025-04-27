import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        AutoSizeText(
          title,
          style: Styles.normal16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.aboreto().fontFamily,
          ),
        ),
      ],
    );
  }
}
