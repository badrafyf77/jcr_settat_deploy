import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:jcr_settat/core/utils/styles.dart';

class BrandDescription extends StatelessWidget {
  const BrandDescription({
    super.key,
    this.widthPercent = .6,
  });

  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * widthPercent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                "Bienvenue sur le site officiel de Jeunesse Citoyenne Ras El Aïn – Settat",
                style: Styles.normal45,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
