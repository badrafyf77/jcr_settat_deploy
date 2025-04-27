import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/customs/black_container_with_stars.dart';
import 'package:jcr_settat/core/utils/customs/logo.dart';
import 'package:jcr_settat/core/utils/styles.dart';

class PartnersViewFirstPart extends StatelessWidget {
  const PartnersViewFirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlackContainerWithStars(
      height: 260,
      width: MediaQuery.of(context).size.width,
      topLeftRadius: 0,
      topRightRadius: 0,
      bottomLeftRadius: 0,
      bottomRightRadius: 0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(
                flex: 6,
              ),
              const AppLogo(
                width: 220,
                height: 120,
                blackLogo: true,
              ),
              AutoSizeText(
                'Organisations qui se sont associées avec nous',
                style: Styles.normal30.copyWith(
                  color: Colors.black,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              AutoSizeText(
                'Rejoignez les nombreuses entreprises qui soutiennent notre mission',
                style: Styles.normal14.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
