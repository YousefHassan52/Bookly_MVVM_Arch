import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../../core/utils/styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({Key? key, this.submit, this.change}) : super(key: key);
  final Function(String)? submit;
  final Function(String)? change;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(

        onChanged: change??(value){},
        onFieldSubmitted: submit??(value){},
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            suffixIcon: IconButton(onPressed: (){},icon: const Icon(UniconsLine.search,color: Colors.white,size: 18,),),
            hintText: "Search",
            hintStyle: Styles.textStyle14.copyWith(color: Colors.white)

        ),
      ),
    );
  }
}
OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),

    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
