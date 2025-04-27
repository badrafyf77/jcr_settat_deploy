import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/gallery/data/model/gallery_model.dart';
import 'package:jcr_settat/features/gallery/data/repo/gallery_repo.dart';

part 'galleries_state.dart';

class GalleriesCubit extends Cubit<GalleriesState> {
  final GalleryRepo _galleryRepo;
  GalleriesCubit(this._galleryRepo) : super(GalleriesInitial());

  Future<void> getGalleries() async {
    emit(GalleriesLoading());
    var result = await _galleryRepo.getGalleries();
    result.fold((left) {
      emit(GalleriesFailure(err: left.errMessage));
    }, (right) {
      emit(GetGalleriesSuccess(galleriesList: right));
    });
  }
}
