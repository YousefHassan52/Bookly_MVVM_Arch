import 'package:bloc/bloc.dart';
import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:bookly_app_mvvm/features/search/data/repo/search_repo.dart';
import 'package:bookly_app_mvvm/features/search/data/repo/search_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);
  Future<void> fetchSearchBooks({required String searchBook}) async{
    var result= await searchRepo.fetchSearchBooks(searchItem: searchBook);
    result.fold((Failure failure) {
      emit(SearchErrorState(failure.errorMsg));
    }, (List<BookModel> books){
      emit(SearchSuccessState(books));
    });
  }
}
