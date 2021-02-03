import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/values/application_colors.dart';

class CustomCircleButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const CustomCircleButton({Key key, @required this.icon, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ApplicationColors.grey,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: ApplicationColors.grey,
        ),
      ),
    );
  }
}
