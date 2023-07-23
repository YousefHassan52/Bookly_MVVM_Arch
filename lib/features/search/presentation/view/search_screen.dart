import 'package:bookly_app_mvvm/core/utils/api_service.dart';
import 'package:bookly_app_mvvm/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view%20model/search%20cubit/search_cubit.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view/widgets/search_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
      child: const Scaffold(
        body: SearchBody(),
      ),
    );
  }
}
