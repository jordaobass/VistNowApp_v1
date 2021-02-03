import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/application_colors.dart';
import '../values/text_styles.dart';
import 'spacings/vertical_spacing.dart';

class FilterMenuOption extends StatelessWidget {
  final bool isSelected;
  final Function onTap;
  final IconData icon;
  final String description;

  const FilterMenuOption({
    Key key,
    @required this.isSelected,
    @required this.onTap,
    this.icon = Icons.house,
    this.description = 'Descrição',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? ApplicationColors.accent
                : ApplicationColors.lightGrey,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setHeight(20),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              highlightColor: ApplicationColors.primary,
              onTap: onTap,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setHeight(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: ScreenUtil().setHeight(34),
                    color: isSelected
                        ? ApplicationColors.white
                        : ApplicationColors.grey,
                  ),
                  VerticalSpacing(10),
                  Text(
                    'Descrição',
                    style: TextStyles.genericLabel(
                      16,
                      isSelected
                          ? ApplicationColors.white
                          : ApplicationColors.grey,
                      FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
