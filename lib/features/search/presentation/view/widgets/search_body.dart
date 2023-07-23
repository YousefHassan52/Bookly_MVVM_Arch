import 'package:bookly_app_mvvm/features/search/presentation/view%20model/search%20cubit/search_cubit.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:bookly_app_mvvm/features/search/presentation/view/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit=SearchCubit.get(context);
        return SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomSearchField(
                    change: (value) {
                      if(value!="") {
                        cubit.fetchSearchBooks(searchBook: value);
                      }

                    },

                  )
              ),
              const SearchList(),
            ],
          ),
        );
      },
    );
  }

}
