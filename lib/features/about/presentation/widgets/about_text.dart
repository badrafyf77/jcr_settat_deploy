import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class AboutText extends StatelessWidget {
  const AboutText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String definition =
        "Jeunesse Citoyenne Ras El Aïn est une association locale à but non lucratif, fondée par un groupe de jeunes engagés souhaitant contribuer positivement à la société.";
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            definition,
            style: Styles.normal18.copyWith(
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 5),
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "Notre association œuvre pour le développement social, culturel et éducatif de notre région. À travers divers projets, événements et initiatives citoyennes, nous aspirons à renforcer l'engagement des jeunes et promouvoir une citoyenneté active et responsable.",
                style: Styles.normal18.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: AutoSizeText(
                    "👉 Rejoignez-nous dans notre mission pour un avenir meilleur.",
                    style: Styles.normal18.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: AutoSizeText(
                    "🔍 Découvrez nos activités, nos valeurs et nos partenaires.",
                    style: Styles.normal18.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
