import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/features/events/data/repo/events_repo.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  final EventsRepo _eventsRepo;
  GetEventsCubit(this._eventsRepo) : super(GetEventsInitial());

  Future<void> getEvents() async {
    emit(GetEventsLaoding());
    var result = await _eventsRepo.getEvents();
    result.fold((left) {
      emit(GetEventsFailure(err: left.errMessage));
    }, (right) {
      emit(GetEventsSuccess(eventsList: right));
    });
  }
}
