import 'package:dartz/dartz.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/gallery/data/model/gallery_model.dart';

abstract class GalleryRepo {
  Future<Either<Failure, List<Gallery>>> getGalleries();
}
