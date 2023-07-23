import 'package:bloc/bloc.dart';
import 'package:bookly_app_mvvm/core/errors/errors.dart';
import 'package:bookly_app_mvvm/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/BookModel.dart';


part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async{
    var result=await homeRepo.fetchFeaturedBooks(); // bet return 7agten fe el fail bet return Failure object && fe el success return List<BookModel> object
    result.fold((Failure failure) {
      emit(FeaturedBooksErrorState(failure.errorMsg));
    }, (List<BookModel> success) {
      emit(FeaturedBooksSuccessState(success));
    });
  }

}
