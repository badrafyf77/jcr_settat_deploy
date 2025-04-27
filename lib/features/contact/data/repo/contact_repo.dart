import 'package:dartz/dartz.dart';
import 'package:jcr_settat/core/models/message_model.dart';
import 'package:jcr_settat/core/utils/failures.dart';

abstract class ContactRepo {
  Future<Either<Failure, Unit>> sendMessage(Message message);
}
