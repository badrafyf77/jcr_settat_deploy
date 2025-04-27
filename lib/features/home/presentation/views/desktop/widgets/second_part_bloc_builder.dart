import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/home/presentation/manager/get%20initial%20event%20cubit/get_initial_event_cubit.dart';
import 'package:jcr_settat/features/home/presentation/views/desktop/widgets/event_item.dart';

class CustomDesktopSecondPartBlocBuilder extends StatelessWidget {
  const CustomDesktopSecondPartBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetInitialEventCubit, GetInitialEventState>(
      builder: (context, state) {
        if (state is GetInitialEventSuccess) {
          return EventItem(
            event: state.event,
          );
        }
        return const LoadingEventItem();
      },
    );
  }
}
