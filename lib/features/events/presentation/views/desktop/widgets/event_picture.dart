import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/image_network.dart';

class EventPicture extends StatelessWidget {
  const EventPicture({
    super.key,
    required this.height,
    required this.width,
    required this.alignment,
    required this.url,
  });

  final String url;
  final AlignmentGeometry alignment;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: CustomImageNetwork(
        url: url,
        height: height,
        width: width,
        topLeftRaduis: 25,
        topRightRaduis: 25,
        bottomLeftRaduis: 25,
        bottomRightRaduis: 25,
      ),
    );
  }
}
