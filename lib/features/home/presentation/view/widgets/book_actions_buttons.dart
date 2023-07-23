import 'package:flutter/material.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          const Expanded(child: CustomButton(
            text: "Free \$",
            backgroundColor:Colors.white,
            textColor:Colors.black ,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          )),
          Expanded(child: CustomButton(
            onPressed: ()async{
              await launchBookPreview(context: context,url: bookModel.volumeInfo!.previewLink!);
            },
            text:bookModel.volumeInfo!.previewLink!=null? "Free Preview":"Not Available",
            backgroundColor: const Color(0xFFEF8262),
            textColor:Colors.white ,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          )),
        ],
      ),
    );
  }


}
