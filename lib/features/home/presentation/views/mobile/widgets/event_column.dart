import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class MobileEventColumn extends StatelessWidget {
  const MobileEventColumn({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .35,
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            AutoSizeText(
              event.title,
              style: Styles.normal16.copyWith(
                color: Colors.black,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              onPressed: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.eventInfo, 'id', event.id);
              },
              textButton: "Voir Plus",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              height: 25,
              width: 120,
              fontSize: 12,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
