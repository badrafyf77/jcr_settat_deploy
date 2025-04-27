import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/body.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/first_body_part.dart';

class TabletHomeBody extends StatelessWidget {
  const TabletHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            FirstPart(
              widthPercent: .45,
            ),
            SizedBox(height: 25),
            FifthWidget(),
            SizedBox(height: 50),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}
