import 'package:flutter/material.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/features/home/presentation/views/mobile/widgets/back_container.dart';
import 'package:jcr_settat/features/home/presentation/views/mobile/widgets/up_container.dart';

class MobileEventItem extends StatelessWidget {
  const MobileEventItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MobileBackContainer(
            event: event,
          ),
          MobileUpContainer(
            event: event,
          ),
        ],
      ),
    );
  }
}
