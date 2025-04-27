import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/home/data/repo/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirestoreService _firestoreService;

  HomeRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, Event>> getInitialEvent() async {
    try {
      Event event = await _firestoreService.getInitialEvent();
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
