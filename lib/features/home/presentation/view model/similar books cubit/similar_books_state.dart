part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccessState(this.books);
}
class SimilarBooksErrorState extends SimilarBooksState {
  final String errorMsg;

   SimilarBooksErrorState(this.errorMsg);
}
class SimilarBooksLoading extends SimilarBooksState {}
