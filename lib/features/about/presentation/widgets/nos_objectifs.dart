import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class NosObjectifs extends StatelessWidget {
  const NosObjectifs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Nos Objectifs',
          style: Styles.normal24,
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Promouvoir les valeurs de citoyenneté, de solidarité et de responsabilité.",
                style: Styles.normal15.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                "Encourager la participation des jeunes dans la vie sociale et culturelle.",
                style: Styles.normal15.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                "Organiser des ateliers, formations, et événements éducatifs.",
                style: Styles.normal15.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                "Collaborer avec d'autres acteurs associatifs et institutions.",
                style: Styles.normal15.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
