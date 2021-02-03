import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../values/application_colors.dart';
import '../../values/dimensions.dart';
import '../../values/text_styles.dart';

class CustomOutlineButtom extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Widget child;
  final CustomOutlineButtonColor color;
  final bool isEnabled;

  const CustomOutlineButtom({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.child,
    this.color = CustomOutlineButtonColor.primary,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: Dimensions.buttonHeight,
      minWidth: double.infinity,
      buttonColor: ApplicationColors.white,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.buttonBorderRadius,
            ),
          ),
          color: ApplicationColors.white,
        ),
        child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.buttonBorderRadius,
            ),
          ),
          onPressed: isEnabled ? onPressed : null,
          // color: CustomColors.grey9,
          highlightedBorderColor: _color,
          child: child ?? _textWidget(),

          textColor: _color,
        ),
      ),
    );
  }

  Widget _textWidget() {
    return Text(
      label,
      style: TextStyles.loginButton,
    );
  }

  Color get _color {
    switch (color) {
      case CustomOutlineButtonColor.primary:
        return ApplicationColors.accent;
        break;

      default:
        return null;
    }
  }
}

enum CustomOutlineButtonColor {
  primary,
}
