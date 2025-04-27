import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/app_images.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';

class CustomBlockContainer extends StatelessWidget {
  const CustomBlockContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.stars,
                  ),
                  fit: BoxFit.cover,
                  opacity: .2,
                ),
              ),
              child: child,
            ),
          ],
        ),
      ],
    );
  }
}
