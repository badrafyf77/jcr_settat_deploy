import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/config/app_router.dart';

import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/button.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class EventColumn extends StatelessWidget {
  const EventColumn({
    super.key,
    this.event,
  });

  final Event? event;

  @override
  Widget build(BuildContext context) {
    Event fakeEvent = Event(
        id: 'id',
        title: 'Dinner Party of Louis Family',
        description: 'description',
        place: 'place',
        downloadUrl: 'downloadUrl',
        date: Timestamp.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: AutoSizeText(
                  (event != null) ? event!.title : fakeEvent.title,
                  style: Styles.normal35.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                onPressed: () {
                  if (event != null) {
                    AppRouter.navigateToWithUrlParametre(
                        context, AppRouter.eventInfo, 'id', event!.id);
                  }
                },
                textButton: "Voir Plus",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                height: 30,
                width: 120,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
