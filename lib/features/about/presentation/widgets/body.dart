import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/core/utils/customs/views_title.dart';
import 'package:jcr_settat/features/about/presentation/widgets/about_text.dart';
import 'package:jcr_settat/features/about/presentation/widgets/nos_objectifs.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ColumnFadeInAnimation(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViewsTitle(
                title: 'Qui sommes-nous ?',
                lineWidth: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const AboutText(),
              const SizedBox(
                height: 20,
              ),
              const NosObjectifs(),
              const SizedBox(
                height: 20,
              ),
              AppFooter(
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
