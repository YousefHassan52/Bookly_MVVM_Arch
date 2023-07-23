import 'package:bookly_app_mvvm/constants.dart';
import 'package:bookly_app_mvvm/core/utils/routes.dart';
import 'package:bookly_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view%20model/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view%20model/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/api_service.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            HomeRepoImp(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            HomeRepoImp(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kPrimaryColor,
          useMaterial3: true,
        ),
      ),
    );
  }
}
