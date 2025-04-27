import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:jcr_settat/features/about/presentation/about_view.dart';
import 'package:jcr_settat/core/utils/customs/mouse_follower.dart';
import 'package:jcr_settat/features/activity/presentation/views/activities_view.dart';
import 'package:jcr_settat/features/contact/presentation/contact_view.dart';
import 'package:jcr_settat/features/events/presentation/views/event_info_view.dart';
import 'package:jcr_settat/features/events/presentation/views/events_view.dart';
import 'package:jcr_settat/features/gallery/presentation/views/gallery_view.dart';
import 'package:jcr_settat/features/home/presentation/views/home_view.dart';
import 'package:jcr_settat/features/partners/presentation/partners_view.dart';

class AppRouter {
  static const home = '/';
  static const about = '/about';
  static const events = '/events';
  static const eventInfo = '/eventInfo';
  static const activities = '/activities';
  static const gallery = '/gallery';
  static const partners = '/partners';
  static const contact = '/contact';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: home,
          pageBuilder: (context, state) {
            if (kIsWeb) {
              MetaSEO meta = MetaSEO();
              meta.ogTitle(ogTitle: 'JCR Settat');
              meta.description(description: 'JCR Settat');
              meta.keywords(
                  keywords: 'JCR Settat, Settat, Maroc');
            }
            return const NoTransitionPage(
              child: MouseFollowerWidget(
                child: HomeView(),
              ),
            );
          }),
      GoRoute(
        path: about,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: AboutView(),
          ),
        ),
      ),
      GoRoute(
        path: events,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: EventsView(),
          ),
        ),
      ),
      GoRoute(
        name: eventInfo,
        path: '$eventInfo/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: EventInfoView(
                id: id,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: activities,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: ActivitiesView(),
          ),
        ),
      ),
      GoRoute(
        path: gallery,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: GalleryView(),
          ),
        ),
      ),
      GoRoute(
        path: partners,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: PartnersView(),
          ),
        ),
      ),
      GoRoute(
        path: contact,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: ContactView(),
          ),
        ),
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    context.go(
      path,
    );
  }

  static void navigateToWithUrlParametre(
      BuildContext context, String name, String id, String value) {
    context.goNamed(name, pathParameters: {id: value});
  }
}
