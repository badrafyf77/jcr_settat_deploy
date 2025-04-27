part of 'activities_cubit.dart';

sealed class ActivitiesState {}

final class ActivitiesInitial extends ActivitiesState {}

final class ActivitiesLaoding extends ActivitiesState {}

final class GetActivitiesSuccess extends ActivitiesState {
  final List<Activity> activitiesList;

  GetActivitiesSuccess({required this.activitiesList});
}

final class ActivitiesFailure extends ActivitiesState {
  final String err;

  ActivitiesFailure({required this.err});
}