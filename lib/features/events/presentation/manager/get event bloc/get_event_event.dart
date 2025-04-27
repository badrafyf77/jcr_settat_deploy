part of 'get_event_bloc.dart';

sealed class GetEventEvent {}

class GetEvent extends GetEventEvent {
  final String id;

  GetEvent({required this.id});
}
