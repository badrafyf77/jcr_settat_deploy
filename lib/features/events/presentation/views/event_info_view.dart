import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/events/presentation/manager/get%20event%20bloc/get_event_bloc.dart';
import 'package:jcr_settat/features/events/presentation/views/desktop/event_info_body.dart';
import 'package:jcr_settat/features/events/presentation/views/mobile/event_info_body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class EventInfoView extends StatefulWidget {
  const EventInfoView({super.key, required this.id});

  final String id;

  @override
  State<EventInfoView> createState() => _EventInfoViewState();
}

class _EventInfoViewState extends State<EventInfoView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetEventBloc>(context).add(GetEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isEventsSelected: true,
      desktopBody: EventInfoBody(
        id: widget.id,
      ),
      tabletBody: MobileEventInfoBody(
        id: widget.id,
      ),
      mobileBody: MobileEventInfoBody(
        id: widget.id,
      ),
    );
  }
}
