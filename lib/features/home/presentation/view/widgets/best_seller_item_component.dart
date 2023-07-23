import 'package:bookly_app_mvvm/core/utils/routes.dart';
import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BestSellerItemComponent extends StatelessWidget {
  const BestSellerItemComponent({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.bookDetailsRoute,extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 125,
              child: BookCover( imageUrl:bookModel.volumeInfo!.imageLinks?.thumbnail??"https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg",),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo!.title??"Title",
                    style:
                    Styles.textStyle20.copyWith(fontFamily: timesNewRomans),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 3,
                  ),

                     bookModel.volumeInfo!.authors!.isNotEmpty?Text(bookModel.volumeInfo!.authors![0],maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles.textStyle14.copyWith(color: Colors.grey[600]),):Text("Unknown Author",maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles.textStyle14.copyWith(color: Colors.grey[600]),),
                  const SizedBox(height: 6,),
                   Row(
                    children: [
                      const Text("Free",style: Styles.textStyle16,),
                      const Spacer(),
                      BookRating(averageRating:bookModel.volumeInfo!.averageRating??0 ,ratingsCount:bookModel.volumeInfo!.ratingsCount??0 ,)


                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
