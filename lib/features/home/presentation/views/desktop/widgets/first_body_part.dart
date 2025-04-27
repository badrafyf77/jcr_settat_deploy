import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';
import 'package:jcr_settat/features/home/presentation/views/widgets/brand_description.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
    this.widthPercent = .35,
  });

  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppLogo(
          height: 200,
          width: 300,
        ),
        const SizedBox(
          height: 20,
        ),
        const BrandDescription(),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.about);
          },
          textButton: "VOIR PLUS",
          backgroundColor: AppColors.kPrimaryColor,
          height: 40,
          width: 160,
        ),
      ],
    );
  }
}
