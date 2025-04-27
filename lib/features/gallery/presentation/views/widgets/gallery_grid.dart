import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/custom_gridview_animation_config.dart';
import 'package:jcr_settat/core/utils/customs/laoding_indicator.dart';
import 'package:jcr_settat/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:jcr_settat/features/gallery/presentation/views/widgets/gallery_card.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleriesCubit, GalleriesState>(
      builder: (context, state) {
        if (state is GalleriesFailure) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<GalleriesCubit>(context).getGalleries();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          );
        }
        if (state is GetGalleriesSuccess) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimationLimiter(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: MasonryGridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount:
                          getCrossAxisCount(MediaQuery.of(context).size.width),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount: state.galleriesList.length,
                      itemBuilder: (context, index) {
                        return CustomGridviewAnimationConfig(
                          index: index,
                          columnCount: state.galleriesList.length,
                          child: GalleryCard(
                            gallery: state.galleriesList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const AppFooter(),
            ],
          );
        }
        return const LoadingCircle();
      },
    );
  }
}

int getCrossAxisCount(double width) {
  if (width < 800) {
    return 1;
  } else {
    return 2;
  }
}
