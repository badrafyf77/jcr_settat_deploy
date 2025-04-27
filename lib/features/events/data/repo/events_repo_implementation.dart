import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/events/data/repo/events_repo.dart';

class EventsRepoImplementation implements EventsRepo {
  final FirestoreService _firestoreService;
  EventsRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, List<Event>>> getEvents() async {
    try {
      List<Event> eventsList = await _firestoreService.getEvents();
      return right(eventsList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, Event>> getEvent(String id) async {
    try {
      Event event = await _firestoreService.getEvent(id);
      return right(event);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
