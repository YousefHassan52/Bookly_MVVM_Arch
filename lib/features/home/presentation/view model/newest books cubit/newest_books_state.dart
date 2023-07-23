part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksSuccessState extends NewestBooksState {
 final List<BookModel> books;

  NewestBooksSuccessState(this.books);
}
class NewestBooksErrorState extends NewestBooksState {
  final String errorMsg;

  NewestBooksErrorState(this.errorMsg);
}
class NewestBooksLoadingState extends NewestBooksState {}
