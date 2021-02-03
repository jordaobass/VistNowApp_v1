import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/application_colors.dart';

class CircleButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const CircleButton({
    Key key,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ApplicationColors.lightGrey,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: ScreenUtil().setHeight(19),
              color: ApplicationColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
