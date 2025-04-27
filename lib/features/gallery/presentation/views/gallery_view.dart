import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jcr_settat/features/gallery/presentation/manager/galleries%20cubit/galleries_cubit.dart';
import 'package:jcr_settat/features/gallery/presentation/views/widgets/gallery_body.dart';
import 'package:jcr_settat/responsive/general_scaffold.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GalleriesCubit>(context).getGalleries();
  }

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isGallerySelected: true,
      desktopBody: GalleryBody(),
      tabletBody: GalleryBody(),
      mobileBody: GalleryBody(),
    );
  }
}
