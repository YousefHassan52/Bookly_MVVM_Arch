
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text("Latest Books",style: Styles.textStyle18,),
        ],
      ),
    );
  }
}


