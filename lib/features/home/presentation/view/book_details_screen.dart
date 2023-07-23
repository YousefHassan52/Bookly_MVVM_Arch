import 'package:bookly_app_mvvm/core/utils/api_service.dart';
import 'package:bookly_app_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view%20model/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/book_details_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/BookModel.dart';


class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(HomeRepoImp(ApiService(Dio())))..fetchSimilarBooks(category: book.volumeInfo!.categories![0]),
      child: Scaffold(
        body: BookDetailsBody(book: book,),
      ),
    );
  }
}
