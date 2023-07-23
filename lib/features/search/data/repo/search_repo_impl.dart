import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:bookly_app_mvvm/core/models/BookModel.dart';
import 'package:bookly_app_mvvm/core/utils/api_service.dart';
import 'package:bookly_app_mvvm/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo{
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String searchItem}) async{
    
    try {
      var result=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=$searchItem");
      List<BookModel> books=[];
      for(var item in result["items"])
        {
          books.add(BookModel.fromJson(item));
        }
      return right(books);
    } catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }



    
  }
  
}