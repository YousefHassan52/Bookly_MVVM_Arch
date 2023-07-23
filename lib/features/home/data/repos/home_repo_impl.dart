import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:bookly_app_mvvm/core/utils/api_service.dart';
import 'package:bookly_app_mvvm/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/BookModel.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
     try {
       var value=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=programming");

             List<BookModel> books=[];
             for(var item in value["items"])
               {
                 books.add(BookModel.fromJson(item));
               }
             return right(books);
     }  catch (e) {
       if(e is DioException) {

         return left(ServerFailure.fromDio(e));

       }else {
         return left(ServerFailure(e.toString()));
       }
     }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      var value=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=computer science");

      List<BookModel> books=[];
      for(var item in value["items"])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e) {
      if(e is DioException) {

        return left(ServerFailure.fromDio(e));

      }else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var value=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=subject:$category");

      List<BookModel> books=[];
      for(var item in value["items"])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e) {
      if(e is DioException) {

        return left(ServerFailure.fromDio(e));

      }else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}