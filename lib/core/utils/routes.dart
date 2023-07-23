import 'package:bookly_app_mvvm/features/home/presentation/view/book_details_screen.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/home_screen.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view/search_screen.dart';
import 'package:bookly_app_mvvm/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/BookModel.dart';

abstract class AppRouter{

  static const String homeRoute='/homeScreen';
  static const String bookDetailsRoute='/bookDetailsScreen';
  static const String searchScreenRoute='/searchScreenRoute';
  static final  GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },

      ),
      GoRoute(
        path: homeRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },

      ),
      GoRoute(
        path: bookDetailsRoute,
        builder: (BuildContext context, GoRouterState state) {
          return  BookDetailsScreen(book: state.extra as BookModel,);
        },

      ),
      GoRoute(
        path: searchScreenRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        },

      ),
    ],
  );
}
