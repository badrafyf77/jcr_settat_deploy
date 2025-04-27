import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/custom_listview_animation_config.dart';
import 'package:jcr_settat/core/utils/customs/laoding_indicator.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/error_iconbutton.dart';
import 'package:jcr_settat/features/home/presentation/views/mobile/widgets/second_part.dart';

class MobileEventsBody extends StatelessWidget {
  const MobileEventsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEventsCubit, GetEventsState>(
      builder: (context, state) {
        if (state is GetEventsFailure) {
          return ErrorAndRetry(
            err: state.err,
          );
        }
        if (state is GetEventsSuccess) {
          return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: state.eventsList.length,
                itemBuilder: (context, index) {
                  return CustomListviewAnimationConfig(
                    index: index,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: MobileEventItem(
                            event: state.eventsList[index],
                          ),
                        ),
                        if (index == state.eventsList.length - 1)
                          const AppFooter(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const LoadingCircle();
      },
    );
  }
}
