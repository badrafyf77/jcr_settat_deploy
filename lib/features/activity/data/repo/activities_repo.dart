import 'package:dartz/dartz.dart';
import 'package:jcr_settat/core/utils/failures.dart';
import 'package:jcr_settat/features/activity/data/model/activity_model.dart';

abstract class ActivitiesRepo {
  Future<Either<Failure, List<Activity>>> getActivities();
}
