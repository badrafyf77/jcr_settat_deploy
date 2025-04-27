import 'package:get_it/get_it.dart';
import 'package:jcr_settat/core/services/firestore_service.dart';
import 'package:jcr_settat/features/activity/data/repo/activities_repo_implementation.dart';
import 'package:jcr_settat/features/contact/data/repo/contact_repo_implementation.dart';
import 'package:jcr_settat/features/events/data/repo/events_repo_implementation.dart';
import 'package:jcr_settat/features/gallery/data/repo/gallery_repo_implementation.dart';
import 'package:jcr_settat/features/home/data/repo/home_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<EventsRepoImplementation>(
    EventsRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<ActivitiesRepoImplementation>(
    ActivitiesRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<GalleryRepoImplementation>(
    GalleryRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<ContactRepoImplementation>(
    ContactRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
}
