import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/custom_gridview_animation_config.dart';
import 'package:jcr_settat/core/utils/customs/laoding_indicator.dart';
import 'package:jcr_settat/features/activity/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:jcr_settat/features/activity/presentation/views/widgets/activitiy_card.dart';

class ActivitiesGrid extends StatelessWidget {
  const ActivitiesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
        builder: (context, state) {
          if (state is ActivitiesFailure) {
            return IconButton(
              onPressed: () {
                BlocProvider.of<ActivitiesCubit>(context).getActivities();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            );
          }
          if (state is GetActivitiesSuccess) {
            return Column(
              children: [
                GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        getCrossAxisCount(MediaQuery.of(context).size.width),
                    mainAxisExtent: 400.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 4.0,
                  ),
                  itemCount: state.activitiesList.length,
                  itemBuilder: (context, index) {
                    return CustomGridviewAnimationConfig(
                      index: index,
                      columnCount: state.activitiesList.length,
                      child: ActivityCard(
                        activity: state.activitiesList[index],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const AppFooter(),
              ],
            );
          }
          return const LoadingCircle();
        },
      ),
    );
  }
}

int getCrossAxisCount(double width) {
  if (width < 722) {
    return 1;
  } else if (width < 1059) {
    return 2;
  } else {
    return 3;
  }
}
