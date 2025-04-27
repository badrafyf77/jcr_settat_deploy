import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/features/events/data/repo/events_repo.dart';

part 'get_event_event.dart';
part 'get_event_state.dart';

class GetEventBloc extends Bloc<GetEventEvent, GetEventState> {
  final EventsRepo _eventsRepo;
  GetEventBloc(this._eventsRepo) : super(GetEventInitial()) {
    on<GetEventEvent>((event, emit) async {
      if (event is GetEvent) {
        emit(GetEventLoading());
        var result = await _eventsRepo.getEvent(event.id);
        result.fold((left) {
          emit(GetEventFailure(err: left.errMessage));
        }, (right) {
          emit(GetEventSuccess(event: right));
        });
      }
    });
  }
}
