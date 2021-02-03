import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../application/assets/images/images.dart';
import '../../../../application/values/dimensions.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/widgets/buttons/circle_button.dart';
import '../../../../application/widgets/buttons/custom_button.dart';
import '../../../../application/widgets/buttons/custom_outline_button.dart';
import '../../../../application/widgets/custom_divider.dart';
import '../../../../application/widgets/rounded_page.dart';
import '../../../../application/widgets/screen_focus_manager.dart';
import '../../../../application/widgets/spacings/vertical_spacing.dart';
import '../../../../application/widgets/text_fields/standard_text_field.dart';
import '../../components/facebook_button.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _controller;

  const LoginScreen({
    Key key,
    @required LoginController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return ScreenFocusManager(
      child: RoundedPage(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: Dimensions.fullScreenHeight,
              width: Dimensions.fullScreenWidth,
              child: Column(
                children: [
                  _header(),
                  _body(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(25),
        left: Dimensions.horizontalPadding,
        right: Dimensions.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleButton(
            icon: MdiIcons.close,
            onTap: _controller.popCurrentPage,
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
      child: Column(
        children: [
          _logo(),
          VerticalSpacing(30),
          _emailForm(context),
          VerticalSpacing(20),
          _passwordForm(),
          VerticalSpacing(20),
          _loginButton(),
          VerticalSpacing(30),
          CustomDivider(
            label: Strings.or,
          ),
          VerticalSpacing(20),
          _facebookButton(),
          VerticalSpacing(20),
          _createAccountButton(),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.logo),
        ),
      ),
    );
  }

  Widget _emailForm(BuildContext context) {
    return Obx(() {
      var currentState = _controller.emailState;

      return StandardTextField(
        label: Strings.emailLabel,
        hint: Strings.emailHint,
        errorText: currentState.validator(currentState.currentValue),
        onChanged: _controller.onChangedEmailState,
        isValid: currentState.isFormValid,
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        // textInputAction: TextInputAction.done,
      );
    });
  }

  Widget _passwordForm() {
    return Obx(() {
      var currentState = _controller.passwordState;

      return StandardTextField(
        isPasswordField: true,
        label: Strings.passwordLabel,
        hint: Strings.passwordHint,
        errorText: currentState.validator(currentState.currentValue),
        onChanged: _controller.onChangedPasswordState,
        isValid: currentState.isFormValid,
        textInputAction: TextInputAction.done,
      );
    });
  }

  Widget _facebookButton() {
    return Obx(() {
      var isLoading = _controller.isLoading;

      return FacebookButton(
        onTap: isLoading ? null : () {},
      );
    });
  }

  Widget _loginButton() {
    return Obx(() {
      var isLoading = _controller.isLoading;

      return CustomButton(
        onTap: _controller.login,
        label: Strings.continueButton,
        buttonColor: CustomButtonColor.primary,
        isEnabled: _controller.isFormValid && !isLoading,
        isLoading: isLoading,
      );
    });
  }

  Widget _createAccountButton() {
    return CustomOutlineButtom(
      label: Strings.createYourAccount,
      onPressed: _controller.navigateToCreateAccount,
    );
  }
}
