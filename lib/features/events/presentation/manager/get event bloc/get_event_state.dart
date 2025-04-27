part of 'get_event_bloc.dart';

sealed class GetEventState {}

final class GetEventInitial extends GetEventState {}

final class GetEventLoading extends GetEventState {}

final class GetEventSuccess extends GetEventState {
  final Event event;

  GetEventSuccess({required this.event});
}

final class GetEventFailure extends GetEventState {
  final String err;

  GetEventFailure({required this.err});
}
