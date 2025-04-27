import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/core/models/message_model.dart';
import 'package:jcr_settat/features/contact/data/repo/contact_repo.dart';
import 'package:uuid/uuid.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final ContactRepo _contactRepo;
  SendMessageBloc(this._contactRepo) : super(SendMessageInitial()) {
    on<SendMessageEvent>((event, emit) async {
      if (event is SendMessage) {
        try {
          emit(SendMessageLaoding());
          var id = const Uuid().v4();
          Message message = Message(
            id: id,
            message: event.message,
            senderNom: event.nom,
            senderPhone: event.telephone,
            senderEmail: event.email,
            isReaded: false,
            sendAt: Timestamp.now(),
          );
          var result = await _contactRepo.sendMessage(message);
          result.fold((left) {
            emit(SendMessageFailure(err: left.errMessage));
          }, (right) {
            emit(SendMessageSuccess());
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    });
  }
}
