import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: Icon(Icons.close,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
        ],),
    );
  }
}
