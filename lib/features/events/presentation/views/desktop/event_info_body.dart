import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20event%20bloc/get_event_bloc.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/black_container.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/event_info_column.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/event_picture.dart';

class EventInfoBody extends StatelessWidget {
  const EventInfoBody({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    Event fakeEvent = Event(
      id: 'id',
      title: 'title',
      description: 'description',
      place: 'place',
      downloadUrl: 'downloadUrl',
      date: Timestamp.now(),
    );
    return BlocBuilder<GetEventBloc, GetEventState>(
      builder: (context, state) {
        if (state is GetEventFailure) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<GetEventBloc>(context).add(GetEvent(id: id));
            },
            icon: const Icon(Icons.refresh),
          );
        }
        if (state is GetEventSuccess) {
          return CustomBlockContainer(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventInfoColumn(event: state.event),
                  const SizedBox(width: 20),
                  EventPicture(
                    url: state.event.downloadUrl,
                    alignment: Alignment.centerRight,
                    height: 250,
                    width: 400,
                  ),
                ],
              ),
            ),
          );
        }
        return Skeletonizer(
          enabled: true,
          child: CustomBlockContainer(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventInfoColumn(event: fakeEvent),
                  const SizedBox(width: 20),
                  EventPicture(
                    url: fakeEvent.downloadUrl,
                    alignment: Alignment.centerRight,
                    height: 250,
                    width: 400,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
