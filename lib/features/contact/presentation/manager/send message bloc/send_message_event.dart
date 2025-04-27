part of 'send_message_bloc.dart';

@immutable
abstract class SendMessageEvent {}

class SendMessage extends SendMessageEvent {
  final String nom;
  final String telephone;
  final String email;
  final String message;
  SendMessage({
    required this.nom,
    required this.telephone,
    required this.email,
    required this.message,
  });
}
