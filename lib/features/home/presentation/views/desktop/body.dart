import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jcr_settat/core/utils/app_colors.dart';
import 'package:jcr_settat/core/utils/app_images.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/column_fade_animation.dart';
import 'package:jcr_settat/core/utils/customs/list_view.dart';
import 'package:jcr_settat/core/utils/helpers/is_mobile_checker.dart';
import 'package:jcr_settat/core/utils/styles.dart';
import 'package:jcr_settat/features/activity/presentation/views/widgets/activities_grid.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/first_body_part.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            FirstPart(),
            SizedBox(height: 25),
            FifthWidget(),
            SizedBox(height: 50),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}

class FifthWidget extends StatelessWidget {
  const FifthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              Container(
                height: 2,
                width: 70,
                decoration:
                    const BoxDecoration(color: AppColors.backgroundColor),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: AutoSizeText(
                  "Nos Activités et Initiatives",
                  style: Styles.normal20.copyWith(
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          Text(
            "Découvrez les différentes actions et domaines d'intervention de Jeunesse Citoyenne Ras Elayn Settat :",
            style: Styles.normal28.copyWith(
              color: AppColors.backgroundColor,
            ),
          ),
          const SizedBox(height: 50),
          const TabWidget(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getTabWidth(MediaQuery.of(context).size.width),
            child: TabBar(
              labelStyle: Styles.normal16.copyWith(
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 12 : 16,
              ),
              unselectedLabelStyle: Styles.normal14.copyWith(
                color: AppColors.backgroundColor,
                fontSize: isMobile ? 10 : 14,
              ),
              indicatorColor: AppColors.backgroundColor,
              tabs: const [
                Tab(
                  text: "Événements et Ateliers",
                ),
                Tab(
                  text: "Actions Locales",
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            height: getGridHeight(MediaQuery.of(context).size),
            child: const TabBarView(
              children: [
                TabView(),
                TabView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: cases.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossAxisCount(MediaQuery.of(context).size.width),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (cntx, index) {
          final snap = cases[index];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.backgroundColor,
                    blurRadius: 0,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.04),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            snap.image!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Text(
                      snap.title!,
                      style: Styles.normal16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Text(
                      snap.description!,
                      style: Styles.normal14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Case {
  final String? image;
  final String? title;
  final String? description;

  Case({
    this.image,
    this.title,
    this.description,
  });
}

Case case1 = Case(
  image: AppAssets.logo,
  title:
      "Nulla enim id excepteur sint consequat sit ipsum voluptate magna id anim laboris.",
  description: "Deserunt adipisicing veniam in aliquip incididunt do dolore.",
);
Case case2 = Case(
  image: AppAssets.logo,
  title:
      "Nulla enim id excepteur sint consequat sit ipsum voluptate magna id anim laboris.",
  description: "Deserunt adipisicing veniam in aliquip incididunt do dolore.",
);
Case case3 = Case(
  image: AppAssets.logo,
  title:
      "Nulla enim id excepteur sint consequat sit ipsum voluptate magna id anim laboris.",
  description: "Deserunt adipisicing veniam in aliquip incididunt do dolore.",
);

Case case4 = Case(
  image: AppAssets.logo,
  title:
      "Nulla enim id excepteur sint consequat sit ipsum voluptate magna id anim laboris.",
  description: "Deserunt adipisicing veniam in aliquip incididunt do dolore.",
);

List<Case> cases = [
  case1,
  case2,
  case3,
  case4,
];

double getGridHeight(Size size) {
  if (size.width < 722) {
    return size.width * 3.5;
  } else if (size.width < 1059) {
    return 800;
  } else {
    return 1000;
  }
}

double getTabWidth(double width) {
  if (width < 722) {
    return width;
  } else if (width < 1059) {
    return width * .7;
  } else {
    return width * .5;
  }
}
