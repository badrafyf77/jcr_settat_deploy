import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/gallery/data/model/gallery_model.dart';
import 'package:jcr_settat/features/gallery/data/repo/gallery_repo.dart';

class GalleryRepoImplementation implements GalleryRepo {
  final FirestoreService _firestoreService;

  GalleryRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, List<Gallery>>> getGalleries() async {
    try {
      var galleriesList = await _firestoreService.getGalleries();
      return right(galleriesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }
}
