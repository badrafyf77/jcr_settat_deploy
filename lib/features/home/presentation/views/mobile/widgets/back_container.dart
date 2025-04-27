import 'package:flutter/material.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/black_container_with_stars.dart';
import 'package:jcr_settat/features/home/presentation/views/mobile/widgets/counter_time_column.dart';
import 'package:jcr_settat/features/home/presentation/views/mobile/widgets/event_column.dart';

class MobileBackContainer extends StatelessWidget {
  const MobileBackContainer({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BlackContainerWithStars(
      height: 165,
      width: MediaQuery.of(context).size.width * .92,
      topLeftRadius: 18,
      topRightRadius: 18,
      bottomRightRadius: 18,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MobileEventColumn(
              event: event,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  MobileCounterTimeColumn(
                    event: event,
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
