import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class AppbarItems extends StatelessWidget {
  const AppbarItems({
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
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        children: [
          AppBarItem(
            isSelected: isHomeSelected,
            text: 'ACCUEIL',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.home);
            },
          ),
          const SizedBox(width: 8),
          AppBarItem(
            isSelected: isAboutSelected,
            text: 'À PROPOS',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.about);
            },
          ),
          // const SizedBox(width: 8),
          // AppBarItem(
          //   isSelected: isEventsSelected,
          //   text: 'ÉVÉNEMENTS',
          //   onPressed: () {
          //     AppRouter.navigateTo(context, AppRouter.events);
          //   },
          // ),
          // const SizedBox(width: 8),
          // AppBarItem(
          //   isSelected: isActivitiesSelected,
          //   text: 'ACTIVITÉS PROPOSÉES',
          //   onPressed: () {
          //     AppRouter.navigateTo(context, AppRouter.activities);
          //   },
          // ),
          // const SizedBox(width: 8),
          // AppBarItem(
          //   isSelected: isGallerySelected,
          //   text: 'GALERIE',
          //   onPressed: () {
          //     AppRouter.navigateTo(context, AppRouter.gallery);
          //   },
          // ),
          const SizedBox(width: 8),
          AppBarItem(
            isSelected: isPartnersSelected,
            text: "PARTENAIRES",
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.partners);
            },
          ),
          // if (width <= 1060)
          //   AppbarDropdown(
          //       itemCount: setNumberOfElementsInAppbarDropdown(width)),
        ],
      ),
    );
  }
}

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  final bool isSelected;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseOnHoverEvent(
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          padding: isSelected
              ? const EdgeInsets.only(
                  bottom: 5,
                )
              : null,
          decoration: isSelected
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1.2,
                    ),
                  ),
                )
              : null,
          child: Text(
            text,
            style: Styles.normal14.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
