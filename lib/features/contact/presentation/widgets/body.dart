import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/core/utils/customs/views_title.dart';
import 'package:jcr_settat/features/contact/presentation/widgets/contact_form.dart';
import 'package:jcr_settat/features/contact/presentation/widgets/flutter_map.dart';
import 'package:jcr_settat/features/contact/presentation/widgets/info.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            const ViewsTitle(
              title: 'CONTACT',
              lineWidth: 160,
              withLogo: false,
            ),
            const SizedBox(
              height: 15,
            ),
            ContactForm(
              width: isMobile
                  ? MediaQuery.of(context).size.width * 0.7
                  : MediaQuery.of(context).size.width * 0.55,
            ),
            const SizedBox(
              height: 30,
            ),
            isMobile
                ? Column(
                    children: [
                      InfoWidget(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const FlutterMapWidget(),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      InfoWidget(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const FlutterMapWidget(),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        AppFooter(
          isMobile: isMobile,
        ),
      ],
    );
  }
}
