import 'package:flutter/material.dart';
import 'package:visit_now/application/values/application_colors.dart';

import '../values/text_styles.dart';
import 'spacings/horizontal_spacing.dart';

class CustomDivider extends StatelessWidget {
  final String label;

  const CustomDivider({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ApplicationColors.mediumGrey,
          ),
        ),
        HorizontalSpacing(10),
        Text(
          label,
          style: TextStyles.customDividerText,
        ),
        HorizontalSpacing(10),
        Expanded(
          child: Divider(
            color: ApplicationColors.mediumGrey,
          ),
        ),
      ],
    );
  }
}
