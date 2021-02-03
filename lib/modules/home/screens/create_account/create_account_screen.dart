import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../application/values/application_colors.dart';
import '../../../../application/values/dimensions.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/values/text_styles.dart';
import '../../../../application/widgets/buttons/circle_button.dart';
import '../../../../application/widgets/buttons/custom_button.dart';
import '../../../../application/widgets/rounded_page.dart';
import '../../../../application/widgets/screen_focus_manager.dart';
import '../../../../application/widgets/spacings/vertical_spacing.dart';
import '../../../../application/widgets/text_fields/standard_text_field.dart';
import 'create_account_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  final CreateAccountController _controller;

  const CreateAccountScreen({
    Key key,
    @required CreateAccountController controller,
  })  : _controller = controller,
        super(key: key);
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  CreateAccountController _controller;

  @override
  void initState() {
    _controller = widget._controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFocusManager(
      child: RoundedPage(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _header(),
                    _body(context),
                  ],
                ),
              ),
            ),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(25),
        left: Dimensions.horizontalPadding,
        right: Dimensions.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ScreenUtil().setHeight(40),
          ),
          Text(
            Strings.createYourAccount,
            style: TextStyles.modalTitle,
          ),
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
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalPadding,
      ),
      child: Column(
        children: [
          VerticalSpacing(30),
          _picture(),
          VerticalSpacing(30),
          _completeNameForm(context),
          VerticalSpacing(20),
          _emailForm(context),
          VerticalSpacing(20),
          _phoneNumberForm(context),
          VerticalSpacing(20),
          _passwordForm(context),
          VerticalSpacing(20),
          _passwordConfirmationForm(context),
          VerticalSpacing(20),
        ],
      ),
    );
  }

  Widget _picture() {
    return Obx(() {
      var emptyPicture = _controller.imageFile == null;

      return InkWell(
        onTap: _controller.getImageFromGalery,
        child: Stack(
          children: [
            Container(
              decoration: emptyPicture
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: ApplicationColors.mediumGrey,
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(_controller.imageFile),
                        fit: BoxFit.cover,
                      ),
                    ),
              child: Container(
                height: ScreenUtil().setHeight(90),
                width: ScreenUtil().setHeight(90),
              ),
            ),
            if (emptyPicture) ...[
              Icon(
                MdiIcons.account,
                color: ApplicationColors.white,
                size: ScreenUtil().setHeight(90),
              ),
            ],
            Positioned(
              top: 0,
              right: ScreenUtil().setWidth(3),
              child: Material(
                color: Colors.transparent,
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: ScreenUtil().setHeight(25),
                  width: ScreenUtil().setHeight(25),
                  decoration: BoxDecoration(
                    color: ApplicationColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    MdiIcons.pencil,
                    size: ScreenUtil().setHeight(15),
                    color: ApplicationColors.accent,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _completeNameForm(BuildContext context) {
    return Obx(() {
      var currentState = _controller.completeNameForm;

      return StandardTextField(
        onChanged: (newValue) => _controller.onChangedForm(
          newValue,
          ControllerFormState.completeName,
        ),
        isValid: currentState.isFormValid,
        label: Strings.completeNameLabel,
        hint: Strings.completeNameHint,
        errorText: currentState.validator(currentState.currentValue),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      );
    });
  }

  Widget _emailForm(BuildContext context) {
    return Obx(() {
      var currentState = _controller.emailForm;

      return StandardTextField(
        onChanged: (newValue) => _controller.onChangedForm(
          newValue,
          ControllerFormState.email,
        ),
        hint: Strings.emailHint,
        isValid: currentState.isFormValid,
        label: Strings.emailLabel,
        errorText: currentState.validator(currentState.currentValue),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      );
    });
  }

  Widget _phoneNumberForm(BuildContext context) {
    var phoneMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Obx(() {
      var currentState = _controller.phoneNumberForm;

      return StandardTextField(
        onChanged: (newValue) {
          _controller.onChangedForm(
            phoneMask.unmaskText(newValue),
            ControllerFormState.phone,
          );
        },
        textInputType: TextInputType.phone,
        isValid: currentState.isFormValid,
        label: Strings.phoneLabel,
        inputFormatters: [phoneMask],
        hint: Strings.phoneHint,
        errorText: currentState.validator(currentState.currentValue),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      );
    });
  }

  Widget _passwordForm(BuildContext context) {
    return Obx(() {
      var currentState = _controller.passwordForm;

      return StandardTextField(
        onChanged: (newValue) => _controller.onChangedForm(
          newValue,
          ControllerFormState.password,
        ),
        isPasswordField: true,
        label: Strings.passwordLabel,
        hint: Strings.passwordHint,
        isValid: currentState.isFormValid,
        errorText: currentState.validator(currentState.currentValue),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
      );
    });
  }

  Widget _passwordConfirmationForm(BuildContext context) {
    return Obx(() {
      var currentState = _controller.passwordConfirmationForm;

      return StandardTextField(
        onChanged: (newValue) => _controller.onChangedForm(
          newValue,
          ControllerFormState.passwordConfirmation,
        ),
        isPasswordField: true,
        textInputAction: TextInputAction.done,
        label: Strings.passwordConfirmationLabel,
        hint: Strings.passwordConfirmationHint,
        isValid: currentState.isFormValid,
        errorText: currentState.validator(currentState.currentValue),
      );
    });
  }

  Widget _signUpButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: Obx(
        () => CustomButton(
          isEnabled: _controller.isFormValid && !_controller.isLoading,
          isLoading: _controller.isLoading,
          buttonColor: CustomButtonColor.primary,
          label: Strings.signUpLabel,
          onTap: () async {
            FocusScope.of(context).unfocus();
            await _controller.registerUser();
          },
        ),
      ),
    );
  }
}
