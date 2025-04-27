import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/icon_and_text.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/counter_time_column.dart';

class MobileEventInfoColumn extends StatelessWidget {
  const MobileEventInfoColumn({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              event.title,
              style: Styles.normal24.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          AutoSizeText(
            event.description,
            style: Styles.normal16.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          IconAndText(
            icon: Icons.place,
            title: event.place,
          ),
          IconAndText(
            icon: Icons.access_time,
            title: DateFormat('yyyy-MM-dd kk:mm').format(event.date.toDate()),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CounterTimeColumn(
              event: event,
              justCounter: true,
            ),
          ),
        ],
      ),
    );
  }
}
