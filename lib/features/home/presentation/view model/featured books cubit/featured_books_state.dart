part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoadingState extends FeaturedBooksState {}
class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;

   FeaturedBooksSuccessState(this.books);
}
class FeaturedBooksErrorState extends FeaturedBooksState {
  final String error;

  FeaturedBooksErrorState(this.error);
}
