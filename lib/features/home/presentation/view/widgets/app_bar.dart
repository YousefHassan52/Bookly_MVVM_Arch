import 'package:bookly_app_mvvm/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import '../../../../../core/utils/assets_helper.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SvgPicture.asset(AssetsHelper.logo,height: 20,),
          const Spacer(),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.searchScreenRoute);
          }, icon: Icon(UniconsLine.search,color: Colors.white,))

        ],
      ),
    );
  }
}
