import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          AutoSizeText(
            'Ras El Aïn, Settat, Maroc',
            style: Styles.normal16.copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mail,
                color: AppColors.kPrimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              AutoSizeText(
                'contact@jeunesse-citoyenne-ras-elayn-settat.ma',
                style: Styles.normal14.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone,
                color: AppColors.kPrimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              AutoSizeText(
                '+212 6 00 00 00 00',
                style: Styles.normal14.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 8,
          child: AutoSizeText(
            text,
            style: Styles.normal14.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
