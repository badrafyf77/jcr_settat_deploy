import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/activity/data/model/activity_model.dart';
import 'package:jcr_settat/features/activity/data/repo/activities_repo.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepo _activitiesRepo;
  ActivitiesCubit(this._activitiesRepo) : super(ActivitiesInitial());

  Future<void> getActivities() async {
    emit(ActivitiesLaoding());
    var result = await _activitiesRepo.getActivities();
    result.fold((left) {
      emit(ActivitiesFailure(err: left.errMessage));
    }, (right) {
      emit(GetActivitiesSuccess(activitiesList: right));
    });
  }
}
