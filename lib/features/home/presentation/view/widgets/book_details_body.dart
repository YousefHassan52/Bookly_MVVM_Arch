import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/book_cover.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/similar_books_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/BookModel.dart';
import 'app_bar_for_book_details.dart';
import 'book_actions_buttons.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key, required this.book,}) : super(key: key);
  final BookModel book;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
      children: [
          const BookDetailsAppBar(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(width: size.width * 0.55, child:  BookCover( imageUrl:book.volumeInfo!.imageLinks?.thumbnail??"https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg",),),
          const SizedBox(
            height: 25,
          ),
           Text(
            book.volumeInfo!.title!,
            style: Styles.textStyle30,
             textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
        if(book.volumeInfo!.authors!.isNotEmpty)
        Opacity(
              opacity: 0.7,
              child: Text(book.volumeInfo!.authors![0],style: Styles.textStyle18,)),
          const SizedBox(height: 5,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             BookRating(averageRating:book.volumeInfo!.averageRating??0 ,ratingsCount: book.volumeInfo!.ratingsCount??0),
            ],
          ),
           BookActionButtons(bookModel: book,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text("You may also like",style: Styles.textStyle14)),
          ),

           SimilarBooksList(size: size,),
          const SizedBox(height: 15,),

      ],
    ),
        ));
  }
}

