import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:visit_now/application/values/application_colors.dart';
import 'package:visit_now/application/values/dimensions.dart';
import 'package:visit_now/application/values/strings.dart';
import 'package:visit_now/application/values/text_styles.dart';
import 'package:visit_now/application/widgets/buttons/circle_button.dart';
import 'package:visit_now/application/widgets/buttons/custom_button.dart';
import 'package:visit_now/application/widgets/buttons/custom_outline_button.dart';
import 'package:visit_now/application/widgets/spacings/vertical_spacing.dart';

import '../../../application/widgets/rounded_page.dart';
import '../models/feedback_arguments.dart';
import 'feedback_controller.dart';

class FeedbackScreen extends StatelessWidget {
  final FeedbackController _controller;

  FeedbackScreen({Key key, @required FeedbackController controller})
      : _controller = controller,
        super(key: key);

  final FeedbackArguments _arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return RoundedPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header(),
                _iconAndInformations(),
                _arguments.isSuccess ? _successButton() : _errorButtons(),
              ],
            ),
          ),
        ],
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleButton(
            icon: MdiIcons.close,
            // onTap: _controller.popCurrentPage,
            onTap: _controller.popToHome,
          ),
        ],
      ),
    );
  }

  Widget _iconAndInformations() {
    return Column(
      children: [
        Container(
          height: ScreenUtil().setHeight(120),
          width: ScreenUtil().setHeight(120),
          decoration: BoxDecoration(
            color: _arguments.isSuccess
                ? ApplicationColors.green
                : ApplicationColors.red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            _arguments.isSuccess ? MdiIcons.check : MdiIcons.close,
            color: ApplicationColors.white,
            size: ScreenUtil().setHeight(60),
          ),
        ),
        VerticalSpacing(25),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ScreenUtil().setWidth(250),
          ),
          child: Text(
            _arguments.title ?? '',
            style: TextStyles.feedbackTitle,
            textAlign: TextAlign.center,
          ),
        ),
        VerticalSpacing(16),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ScreenUtil().setWidth(250),
          ),
          child: Text(
            _arguments.subtitle ?? '',
            style: TextStyles.feedbackDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _successButton() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.horizontalPadding,
        right: Dimensions.horizontalPadding,
        bottom: ScreenUtil().setHeight(25),
      ),
      child: CustomOutlineButtom(
        onPressed: _controller.popToHome,
        label: Strings.backToInitialPageLabel,
      ),
    );
  }

  Widget _errorButtons() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.horizontalPadding,
            right: Dimensions.horizontalPadding,
            bottom: ScreenUtil().setHeight(20),
          ),
          child: CustomButton(
            isEnabled: true,
            isLoading: false,
            buttonColor: CustomButtonColor.primary,
            label: Strings.tryAgainLabel,
            onTap: _controller.popCurrentPage,
          ),
        ),
        _successButton(),
      ],
    );
  }
}
