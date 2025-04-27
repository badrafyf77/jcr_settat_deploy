import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/core/utils/customs/views_title.dart';
import 'package:jcr_settat/features/activity/presentation/views/widgets/activities_grid.dart';

class ActivitiesBody extends StatelessWidget {
  const ActivitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            ViewsTitle(
              title: "ACTIVITÉS PROPOSÉES",
              lineWidth: 380,
              withLogo: false,
            ),
            SizedBox(height: 20),
            ActivitiesGrid(),
          ],
        ),
      ],
    );
  }
}
