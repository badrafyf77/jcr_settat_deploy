import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/activity/data/model/activity_model.dart';
import 'package:jcr_settat/features/activity/data/repo/activities_repo.dart';

class ActivitiesRepoImplementation implements ActivitiesRepo {
  final FirestoreService _firestoreService;

  ActivitiesRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, List<Activity>>> getActivities() async {
    try {
      var activitiesList = await _firestoreService.getActivities();
      return right(activitiesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }
}
