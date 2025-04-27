import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_images.dart';
import 'package:jcr_settat/core/utils/customs/custom_gridview_animation_config.dart';
import 'package:jcr_settat/features/partners/presentation/widgets/partners_card.dart';

class PartnersGrid extends StatelessWidget {
  final List<Map<String, String>> partners = [
    {
      'name': 'Office national marocain du tourisme',
      'image': AppAssets.onmt,
    },
    {
      'name': 'Royal Air Maroc',
      'image': AppAssets.ram,
    },
    {
      'name': 'Centre cinématographique marocain',
      'image': AppAssets.cmm,
    },
    {
      'name': 'Ministère de la Culture, de la Jeunesse et des Sports',
      'image': AppAssets.ministre,
    },
    {
      'name': 'Visit Morocco',
      'image': AppAssets.visitMorocco,
    },
  ];

  PartnersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5167,
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                getCrossAxisCount(MediaQuery.of(context).size.width),
            mainAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          itemCount: partners.length,
          itemBuilder: (context, index) {
            return CustomGridviewAnimationConfig(
              index: index,
              columnCount: partners.length,
              child: PartnersCard(
                name: partners[index]['name']!,
                image: partners[index]['image']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

int getCrossAxisCount(double width) {
  if (width < 200) {
    return 0;
  } else if (width < 300) {
    return 1;
  } else if (width < 600) {
    return 2;
  } else if (width < 900) {
    return 3;
  } else if (width < 1200) {
    return 4;
  } else {
    return 5;
  }
}
