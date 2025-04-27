import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jcr_settat/core/utils/customs/image_network.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/gallery/data/model/gallery_model.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key, required this.gallery});

  final Gallery gallery;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: CustomImageNetwork(
              url: gallery.downloadUrl,
              height: gallery.height.toDouble(),
              width: gallery.width.toDouble(),
              topLeftRaduis: 0,
              topRightRaduis: 0,
              bottomLeftRaduis: 0,
              bottomRightRaduis: 0,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(150),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      gallery.title,
                      style: Styles.normal16.copyWith(
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    AutoSizeText(
                      DateFormat('yyyy-MM-dd').format(gallery.date.toDate()),
                      style: Styles.normal14.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
