part of 'send_message_bloc.dart';

@immutable
abstract class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageLaoding extends SendMessageState {}

final class SendMessageSuccess extends SendMessageState {}

final class SendMessageFailure extends SendMessageState {
  final String err;

  SendMessageFailure({required this.err});
}
