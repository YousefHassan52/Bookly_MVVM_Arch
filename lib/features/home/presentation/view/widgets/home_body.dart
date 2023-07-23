import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'best_seller_text.dart';
import 'books_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            BooksList(size: size),
            const BestSellerText(),
            const BestSellerListView(),
          ],
        ),
      ),
    );
  }
}







// height ratio 0.27 of screen
// ratio between height and width 0.67
