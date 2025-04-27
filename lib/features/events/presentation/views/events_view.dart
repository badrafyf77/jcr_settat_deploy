import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/events_body.dart';
import 'package:jcr_settat/features/events/presentation/views/mobile/events_body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetEventsCubit>(context).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isEventsSelected: true,
      desktopBody: DesktopEventsBody(),
      tabletBody: DesktopEventsBody(),
      mobileBody: MobileEventsBody(),
    );
  }
}
