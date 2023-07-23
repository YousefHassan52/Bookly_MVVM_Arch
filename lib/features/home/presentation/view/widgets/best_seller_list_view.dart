import 'package:bookly_app_mvvm/features/home/presentation/view%20model/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item_component.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccessState) {
          return ListView.builder(
          itemCount: state.books.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BestSellerItemComponent(bookModel: state.books[index],),

        );
        }
        else if(state is NewestBooksErrorState) {
          return Center(child: Text(state.errorMsg));
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
