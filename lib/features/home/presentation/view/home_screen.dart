import 'package:bookly_app_mvvm/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: HomeBody(),
    );
  }
}
