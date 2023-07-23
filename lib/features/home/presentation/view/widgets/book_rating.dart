import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final int ratingsCount;
  final num averageRating;
  const BookRating({
    super.key, required this.ratingsCount, required this.averageRating,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FaIcon(FontAwesomeIcons.solidStar,color: Color(0xFFFFDD4F),size: 13,),
        const SizedBox(width: 6,),
        Text("$averageRating",style: Styles.textStyle16,),
        const SizedBox(width: 6,),
        Text("$ratingsCount",style: Styles.textStyle14.copyWith(color: Colors.grey[700]),),
      ],
    );
  }
}
