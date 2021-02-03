import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../values/application_colors.dart';
import '../../values/dimensions.dart';
import '../../values/text_styles.dart';

class StandardTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String errorText;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  final bool isEnabled;
  final Function(String) onChanged;
  final bool isValid;
  final TextCapitalization textCaptalization;
  final bool isPasswordField;

  const StandardTextField({
    Key key,
    @required this.label,
    @required this.errorText,
    @required this.onChanged,
    @required this.isValid,
    this.isPasswordField = false,
    this.hint,
    this.inputFormatters,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.isEnabled = true,
    this.textCaptalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  _StandardTextFieldState createState() => _StandardTextFieldState();
}

class _StandardTextFieldState extends State<StandardTextField> {
  bool _shouldShowValidation;
  bool isFocused = false;
  bool _isObscureText;

  @override
  void initState() {
    _isObscureText = widget.isPasswordField;
    _shouldShowValidation = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _textFormField();
  }

  Widget _textFormField() {
    return Stack(
      children: [
        Focus(
          onFocusChange: (hasFocus) {
            isFocused = hasFocus;
            setState(() => _shouldShowValidation = !hasFocus);
          },
          child: TextFormField(
            obscureText: _isObscureText,
            decoration: InputDecoration(
              // suffixIcon: widget.isPasswordField
              //     ?
              //     : null,
              labelStyle: TextStyle(
                color: isFocused
                    ? ApplicationColors.accent
                    : ApplicationColors.grey,
              ),
              labelText: widget.label,
              hintText: widget.hint,
              hintStyle: TextStyles.hintTextField,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.only(
                top: ScreenUtil().setHeight(15),
                bottom: ScreenUtil().setHeight(15),
                left: ScreenUtil().setHeight(10),
                right: ScreenUtil().setWidth(35),
              ),
              focusColor: ApplicationColors.accent,
              errorText: _shouldShowValidation ? widget.errorText : null,
              errorStyle: TextStyle(
                color: ApplicationColors.red,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Dimensions.buttonBorderRadius,
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: ApplicationColors.accent,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Dimensions.buttonBorderRadius,
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: ApplicationColors.lightGrey,
                ),
              ),
            ),
            style: TextStyles.textFieldInput,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.textInputType,
            onFieldSubmitted: widget.onFieldSubmitted,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCaptalization,
            enabled: widget.isEnabled,
            onChanged: widget.onChanged,
          ),
        ),
        _sufixIcon(widget.isValid),
      ],
    );
  }

  Widget _sufixIcon(bool isFormValid) {
    if (widget.isPasswordField) return _visibilityIcon();

    if (!_shouldShowValidation) return Container();

    return isFormValid
        ? _roundedIcon(
            iconColor: ApplicationColors.green,
            icon: MdiIcons.check,
          )
        : _roundedIcon(
            iconColor: ApplicationColors.red,
            icon: MdiIcons.close,
          );
  }

  Widget _visibilityIcon() {
    return Positioned(
      right: ScreenUtil().setHeight(0),
      top: ScreenUtil().setHeight(5),
      child: IconButton(
        icon: Icon(
          _isObscureText ? MdiIcons.eye : MdiIcons.eyeOff,
          color: Colors.grey,
          size: ScreenUtil().setHeight(26),
        ),
        onPressed: () {
          setState(() {
            _isObscureText = !_isObscureText;
          });
        },
      ),
    );
  }

  Widget _roundedIcon({@required Color iconColor, @required IconData icon}) {
    return Positioned(
      right: ScreenUtil().setHeight(8),
      top: ScreenUtil().setHeight(15),
      child: Container(
        height: ScreenUtil().setHeight(25),
        width: ScreenUtil().setHeight(25),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: ScreenUtil().setHeight(12),
        ),
      ),
    );
  }

  Color _labelColor(bool hasFocus) {
    if (hasFocus) {
      return ApplicationColors.accent;
    }

    return ApplicationColors.lightGrey;
  }
}
