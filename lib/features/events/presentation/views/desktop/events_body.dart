import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jcr_settat/core/utils/customs/app_footer.dart';
import 'package:jcr_settat/core/utils/customs/custom_listview_animation_config.dart';
import 'package:jcr_settat/core/utils/customs/laoding_indicator.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/widgets/error_iconbutton.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/event_item.dart';

class DesktopEventsBody extends StatelessWidget {
  const DesktopEventsBody({super.key});

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
              child: ListView.separated(
                itemCount: state.eventsList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return CustomListviewAnimationConfig(
                    index: index,
                    child: Column(
                      children: [
                        EventItem(event: state.eventsList[index]),
                        if (index == state.eventsList.length - 1)
                          const Column(
                            children: [
                              SizedBox(height: 30),
                              AppFooter(),
                            ],
                          ),
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
