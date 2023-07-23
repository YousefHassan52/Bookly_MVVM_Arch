import 'package:bookly_app_mvvm/core/utils/assets_helper.dart';
import 'package:bookly_app_mvvm/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    navigateToHomeScreen();

  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return  Center(

      child:
        AnimatedBuilder(
          // fo2eha builder aho
        animation: slidingAnimation,
        builder: (context,_)=> SlideTransition(
          position: slidingAnimation,
          child:SvgPicture.asset(AssetsHelper.logo,height:size.height*0.06 ,),

        ),
      ),


    );
  }
  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),

    );
    slidingAnimation=Tween<Offset>(begin: const Offset(0,20),end: Offset.zero).animate(animationController);
    animationController.forward();
  }
  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds:3000 ),(){
      // Get.to(const HomeScreen(),transition: Transition.zoom,duration: kPrimaryDuration);
      GoRouter.of(context).pushReplacement(AppRouter.homeRoute);
    });
  }

}
