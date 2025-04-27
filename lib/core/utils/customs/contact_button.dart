import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        AppRouter.navigateTo(context, AppRouter.contact);
      },
      textButton: 'CONTACT',
      backgroundColor: AppColors.kPrimaryColor,
      textColor: Colors.black,
      height: 35,
      width: MediaQuery.of(context).size.width * 0.13,
    );
  }
}