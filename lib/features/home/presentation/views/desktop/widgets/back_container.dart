import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/black_container_with_stars.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/counter_time_column.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/second_event_column.dart';

class BackContainer extends StatelessWidget {
  const BackContainer({
    super.key,
    required this.loading,
    required this.event,
  });

  final bool loading;
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      child: BlackContainerWithStars(
        height: MediaQuery.of(context).size.height * .38,
        width: MediaQuery.of(context).size.width * .73,
        bottomLeftRadius: 40,
        bottomRightRadius: 40,
        topRightRadius: 40,
        topLeftRadius: 0,
        child: Skeletonizer(
          enabled: loading,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EventColumn(
                      event: (!loading) ? event : null,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          CounterTimeColumn(
                            event: event,
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .083,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
