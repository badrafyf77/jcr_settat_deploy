import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.kPrimaryColor.withAlpha(150),
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          text,
          style: Styles.normal12.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
