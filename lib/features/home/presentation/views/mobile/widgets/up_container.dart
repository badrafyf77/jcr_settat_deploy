import 'package:flutter/material.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/image_network.dart';

class MobileUpContainer extends StatelessWidget {
  const MobileUpContainer({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width * .5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: CustomImageNetwork(
        url: event.downloadUrl,
        height: 140,
        width: MediaQuery.of(context).size.width * .5,
        topLeftRaduis: 0,
        topRightRaduis: 0,
        bottomLeftRaduis: 20,
        bottomRightRaduis: 20,
      ),
    );
  }
}
