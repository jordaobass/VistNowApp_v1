import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../application/values/application_colors.dart';
import '../../../application/values/dimensions.dart';
import '../../../application/values/text_styles.dart';

class FacebookButton extends StatelessWidget {
  final Function onTap;

  const FacebookButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.buttonHeight,
      width: Dimensions.fullScreenWidth,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.buttonBorderRadius),
        ),
        disabledTextColor: Colors.white,
        disabledColor: Colors.blue,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onTap,
        icon: Icon(MdiIcons.facebook, size: ScreenUtil().setHeight(30)),
        label: Text(
          'Login com Facebook',
          style: TextStyles.genericLabel(
            14,
            ApplicationColors.white,
            FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
