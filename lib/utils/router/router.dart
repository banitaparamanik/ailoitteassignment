import 'package:ailoitteassignment/features/drink_listing/domain/entities/drink_entity.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/views/drink_details_screen.dart';
import 'package:ailoitteassignment/features/drink_listing/presentation/views/drink_list_screen.dart';
import 'package:ailoitteassignment/utils/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(initialLocation: RoutePaths.home, routes: [
  // GoRoute(
  //     path: RoutePaths.splash,
  //     builder: (BuildContext context, GoRouterState state) {
  //       return const Splash();
  //     }),
  GoRoute(
    path: RoutePaths.home,
    routes: [
      GoRoute(
          path: RoutePaths.details,
          builder: (BuildContext context, GoRouterState state) =>
              DrinkDetailsScreen(drink: state.extra as DrinkEntity))
    ],
    builder: (BuildContext context, GoRouterState state) {
      return const DrinkListScreen();
    },
    // redirect: (context, state) {
    //   if (state.extra is List<DrinkEntity>) {
    //     return RoutePaths.home;
    //   } else {
    //     return RoutePaths.splash;
    //   }
    // },
  ),
]);
