import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view%20model/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/routes.dart';
import 'book_cover.dart';

class BooksList extends StatelessWidget {
  const BooksList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccessState)
          {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: size.height * 0.27,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    // if imageLinks=null? حط اللينك الانت كاتبه بأيدك : thumbnail عادي
                    // de targmet el satr el ta7t
                      return InkWell(
                          onTap: (){
                            GoRouter.of(context).push(AppRouter.bookDetailsRoute,extra: state.books[index]);

                          },
                          child: BookCover( imageUrl:state.books[index].volumeInfo!.imageLinks?.thumbnail??"https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg",));


                  }  ),
            );

          }

        else if(state is FeaturedBooksErrorState)
          {
            return Text(state.error,style: Styles.textStyle14,);
          }
        else
        {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
