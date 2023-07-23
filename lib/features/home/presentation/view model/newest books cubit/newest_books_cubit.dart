import 'package:bloc/bloc.dart';
import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks()async{
    var result=await homeRepo.fetchNewestBooks();
    result.fold((Failure failure) {
      emit(NewestBooksErrorState(failure.errorMsg));
    }, (List<BookModel> books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}
