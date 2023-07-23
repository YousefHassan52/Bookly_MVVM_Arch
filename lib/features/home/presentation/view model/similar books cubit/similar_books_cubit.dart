import 'package:bloc/bloc.dart';
import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../data/repos/home_repo_impl.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepoImp homeRepo;
  Future<void> fetchSimilarBooks({required String category})
  async{
    var result=await homeRepo.fetchSimilarBooks(category: category);
    result.fold((Failure failure)  {
      emit(SimilarBooksErrorState(failure.errorMsg));
    }, (List<BookModel> success)  {
      emit(SimilarBooksSuccessState(success));
    });

  }
}
