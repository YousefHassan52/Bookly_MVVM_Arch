import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view%20model/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/routes.dart';
import 'book_cover.dart';

class SimilarBooksList extends StatelessWidget {
  const SimilarBooksList({Key? key, required this.size, }) : super(key: key);
  final Size size;
  
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
  builder: (context, state) {
    if(state is SimilarBooksSuccessState ) {
      if(state.books.isNotEmpty) {
        return SizedBox(
      height: size.height*0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.books.length,
        itemBuilder: (context,index) {
          return index!=0?   InkWell(
              onTap: (){
                GoRouter.of(context).push(AppRouter.bookDetailsRoute,extra: state.books[index]);

              },
              child: BookCover( imageUrl:state.books[index].volumeInfo!.imageLinks?.thumbnail??"https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg",)): Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: InkWell(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.bookDetailsRoute,extra: state.books[index]);

                },
                child: BookCover( imageUrl:state.books[index].volumeInfo!.imageLinks?.thumbnail??"https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg",)),
          );
        },

      ),
    );
      }
      else {
        return const Center(child: Text("No similar books"));
      }
    }
    else if(state is SimilarBooksErrorState)
      {
        return Center(child: Text(state.errorMsg,style: Styles.textStyle14,),);
      }
    else
      {
        return const Center(child: CircularProgressIndicator());
      }
  },
);
  }
}
