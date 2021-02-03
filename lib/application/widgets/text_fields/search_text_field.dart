import 'package:flutter/material.dart';
import 'package:visit_now/application/values/text_styles.dart';

import '../../values/application_colors.dart';
import '../../values/dimensions.dart';

class SearchTextField extends StatefulWidget {
  final String hintText;

  const SearchTextField({
    Key key,
    this.hintText = '',
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.contentSearchFieldStyle,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.hintSearchFieldStyle,
        prefixIcon: Icon(
          Icons.search,
          color: ApplicationColors.grey,
        ),
        filled: true,
        fillColor: ApplicationColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.buttonBorderRadius,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
