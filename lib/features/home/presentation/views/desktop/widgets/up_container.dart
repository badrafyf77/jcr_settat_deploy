import 'package:flutter/material.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/customs/image_network.dart';

class UpContainer extends StatelessWidget {
  const UpContainer({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .038,
      right: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: CustomImageNetwork(
          url: event.downloadUrl,
          height: size.height * .304,
          width: size.width * .304,
          topLeftRaduis: 25,
          topRightRaduis: 25,
          bottomLeftRaduis: 25,
          bottomRightRaduis: 25,
        ),
      ),
    );
  }
}
