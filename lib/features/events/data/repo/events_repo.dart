import 'package:dartz/dartz.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/utils/failures.dart';

abstract class EventsRepo {
  Future<Either<Failure, List<Event>>> getEvents();
  Future<Either<Failure, Event>> getEvent(String id);
}
