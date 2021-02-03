import 'package:flutter/material.dart';

import '../../values/application_colors.dart';
import '../../values/dimensions.dart';
import '../../values/text_styles.dart';

enum CustomButtonColor { primary, secondary }

class CustomButton extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final String label;
  final CustomButtonColor buttonColor;
  final Function onTap;

  const CustomButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.isEnabled = true,
    this.isLoading = false,
    this.buttonColor = CustomButtonColor.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.buttonHeight,
      width: Dimensions.fullScreenWidth,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.buttonBorderRadius),
        ),
        elevation: 0,
        onPressed: isEnabled ? onTap : null,
        highlightColor: isLoading ? Colors.transparent : null,
        splashColor: isLoading ? Colors.transparent : null,
        disabledColor: ApplicationColors.disabled,
        disabledTextColor: ApplicationColors.grey,
        textColor: _textColor,
        color: _backgroundColor,
        child: Center(
          child: Stack(
            children: [
              _text(),
              if (isLoading) _loading(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Center(
      child: Text(
        label,
        style: TextStyles.loginButton,
      ),
    );
  }

  Widget _loading() {
    return Container(
      padding: EdgeInsets.only(right: 24),
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 24,
        width: 24,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              ApplicationColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (buttonColor) {
      case CustomButtonColor.primary:
        return ApplicationColors.accent;
        break;
      case CustomButtonColor.secondary:
        return ApplicationColors.secondary;
        break;
      default:
        return null;
    }
  }

  Color get _textColor {
    switch (buttonColor) {
      case CustomButtonColor.primary:
        return ApplicationColors.white;
        break;
      case CustomButtonColor.secondary:
        return ApplicationColors.white;
        break;
      default:
        return null;
    }
  }
}
