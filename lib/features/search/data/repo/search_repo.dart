import 'package:bookly_app_mvvm/core/models/BookModel.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchBooks({required String searchItem});
}