import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';

import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/back_container.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/up_container.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackContainer(
          loading: false,
          event: event,
        ),
        UpContainer(
          event: event,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .38,
        ),
      ],
    );
  }
}

class LoadingEventItem extends StatelessWidget {
  const LoadingEventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Event event = Event(
        id: 'id',
        title: 'Dinner Party of Louis Family',
        description: 'description',
        place: 'place',
        downloadUrl: 'downloadUrl',
        date: Timestamp.now());
    return Stack(
      children: [
        BackContainer(
          loading: true,
          event: event,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Skeletonizer(
              enabled: true,
              child: AppLogo(),
            ),
          ),
        ),
        Container(
          height: 300,
        ),
      ],
    );
  }
}
