import 'package:dartz/dartz.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, Event>> getInitialEvent();
}
