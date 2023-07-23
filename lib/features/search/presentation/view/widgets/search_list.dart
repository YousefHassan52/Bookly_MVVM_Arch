import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/best_seller_item_component.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view%20model/search%20cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchSuccessState) {
          return Expanded(child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context,index)=>BestSellerItemComponent(bookModel: state.books[index],)));
        }
        else if(state is SearchErrorState)
          {
            return Center(child: Text(state.errorMsg,style: Styles.textStyle16,),);
          }
        else {
          return const Center();
        }
      },
    );
  }
}
