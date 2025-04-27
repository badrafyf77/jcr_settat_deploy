import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/core/utils/customs/views_title.dart';
import 'package:jcr_settat/features/gallery/presentation/views/widgets/gallery_grid.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            ViewsTitle(
              title: 'GALERIE',
              lineWidth: 144,
              withLogo: false,
            ),
            SizedBox(height: 20),
            GalleryGrid(),
          ],
        ),
      ],
    );
  }
}
