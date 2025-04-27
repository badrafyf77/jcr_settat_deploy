import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/helpers/is_mobile_checker.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/activity/data/model/activity_model.dart';
import 'package:jcr_settat/core/utils/customs/image_network.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({super.key, required this.activity});

  final Activity activity;

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          onEnter: !isMobile
              ? (event) {
                  setState(() {
                    isHover = true;
                  });
                }
              : null,
          onExit: !isMobile
              ? (event) {
                  setState(() {
                    isHover = false;
                  });
                }
              : null,
          child: CustomImageNetwork(
            url: widget.activity.downloadUrl,
            height: 180,
            width: 320,
            topLeftRaduis: 18,
            topRightRaduis: 18,
            bottomLeftRaduis: 0,
            bottomRightRaduis: 0,
          ),
        ),
        Container(
          height: 200,
          width: 320,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      widget.activity.title,
                      style: Styles.normal16.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        widget.activity.description,
                        style: Styles.normal14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 6,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              ActivityContainerBottom(
                isHover: isHover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActivityContainerBottom extends StatelessWidget {
  const ActivityContainerBottom({
    super.key,
    required this.isHover,
  });

  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          color: isHover ? AppColors.kPrimaryColor : Colors.grey,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
