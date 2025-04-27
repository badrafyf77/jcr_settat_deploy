import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jcr_settat/core/models/message_model.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/contact/data/repo/contact_repo.dart';

class ContactRepoImplementation implements ContactRepo {
  final FirestoreService _firestoreService;

  ContactRepoImplementation(this._firestoreService);
  @override
  Future<Either<Failure, Unit>> sendMessage(Message message) async {
    try {
      await _firestoreService.addMessage(message);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
