import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/app_images.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';
import 'package:jcr_settat/features/home/presentation/views/widgets/brand_description.dart';

class FirstPartMobile extends StatelessWidget {
  const FirstPartMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.logo,
          height: 120,
          width: 180,
        ),
        const SizedBox(
          height: 20,
        ),
        const BrandDescription(
          widthPercent: .85,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.about);
          },
          textButton: "VOIR PLUS",
          backgroundColor: AppColors.kPrimaryColor,
          height: 30,
          width: 130,
          fontSize: 12,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
