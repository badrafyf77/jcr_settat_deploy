import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/activity/presentation/manager/activities%20cubit/activities_cubit.dart';
import 'package:jcr_settat/features/activity/presentation/views/widgets/activities_body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ActivitiesCubit>(context).getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isActivitiesSelected: true,
      desktopBody: ActivitiesBody(),
      tabletBody: ActivitiesBody(),
      mobileBody: ActivitiesBody(),
    );
  }
}
