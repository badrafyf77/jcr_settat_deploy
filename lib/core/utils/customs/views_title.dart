import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/customs/horizontal_line.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class ViewsTitle extends StatelessWidget {
  const ViewsTitle({
    super.key,
    required this.title,
    required this.lineWidth,
    this.withLogo = true, this.fontSize,
  });

  final String title;
  final double lineWidth;
  final bool withLogo;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          if (withLogo)
            const AppLogo(
              height: 120,
              width: 200,
            ),
          AutoSizeText(
            title,
            style: Styles.normal35.copyWith(
              fontSize: fontSize,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: lineWidth,
            child: const HorizontalLine(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
