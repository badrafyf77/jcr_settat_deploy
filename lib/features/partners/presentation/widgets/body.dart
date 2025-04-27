import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/features/partners/presentation/widgets/partners_grid.dart';
import 'package:jcr_settat/features/partners/presentation/widgets/partners_view_first_part.dart';

class PartnersBody extends StatelessWidget {
  const PartnersBody({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            const PartnersViewFirstPart(),
            PartnersGrid(),
            AppFooter(
              isMobile: isMobile,
            ),
          ],
        ),
      ],
    );
  }
}
