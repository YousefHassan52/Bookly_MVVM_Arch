part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
  List<BookModel> books;

  SearchSuccessState(this.books);
}
class SearchErrorState extends SearchState {
  final String errorMsg;

  SearchErrorState(this.errorMsg);
}
