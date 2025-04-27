part of 'galleries_cubit.dart';

sealed class GalleriesState {}

final class GalleriesInitial extends GalleriesState {}

final class GalleriesLoading extends GalleriesState {}

final class GetGalleriesSuccess extends GalleriesState {
  final List<Gallery> galleriesList;

  GetGalleriesSuccess({required this.galleriesList});
}


final class GalleriesFailure extends GalleriesState {
  final String err;

  GalleriesFailure({required this.err});
}