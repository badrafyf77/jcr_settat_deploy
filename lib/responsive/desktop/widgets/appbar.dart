import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/contact_button.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';
import 'package:jcr_settat/responsive/desktop/widgets/appbar_items.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({
    super.key,
    required this.isHomeSelected,
    required this.isAboutSelected,
    required this.isEventsSelected,
    required this.isActivitiesSelected,
    required this.isGallerySelected,
    required this.isUserTermsSelected,
    required this.isPartnersSelected,
  });

  final bool isHomeSelected;
  final bool isAboutSelected;
  final bool isEventsSelected;
  final bool isActivitiesSelected;
  final bool isGallerySelected;
  final bool isUserTermsSelected;
  final bool isPartnersSelected;

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogo(),
        AppbarItems(
          isHomeSelected: isHomeSelected,
          isAboutSelected: isAboutSelected,
          isEventsSelected: isEventsSelected,
          isActivitiesSelected: isActivitiesSelected,
          isGallerySelected: isGallerySelected,
          isUserTermsSelected: isUserTermsSelected,
          isPartnersSelected: isPartnersSelected,
        ),
        const ContactButton(),
      ],
    ),
    );
  }
}
