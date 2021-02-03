import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../application/assets/images/images.dart';
import '../../../../application/controllers/authentication_controller.dart';
import '../../../../application/values/dimensions.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/values/text_styles.dart';
import '../../../../application/widgets/buttons/custom_button.dart';
import '../../../../application/widgets/spacings/vertical_spacing.dart';
import 'favorites_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final AuthenticationController _authenticationController;
  final FavoritesController _controller;

  const FavoritesScreen({
    Key key,
    @required AuthenticationController authenticationController,
    @required FavoritesController controller,
  })  : _authenticationController = authenticationController,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (_authenticationController.userLoggedIn) {
            return Container(); //TODO: implements the favorites screen
          }
          return emptyUserScreen();
        },
      ),
    );
  }

  Widget emptyUserScreen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
      height: Dimensions.fullScreenHeight,
      width: Dimensions.fullScreenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VerticalSpacing(60),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.favoritesPlacesTitle,
              style: TextStyles.genericEmptyScreenTitle,
              textAlign: TextAlign.start,
            ),
          ),
          VerticalSpacing(40),
          Text(
            Strings.favoritesPlacesMessage,
            style: TextStyles.genericEmptyScreenDescription,
          ),
          VerticalSpacing(80),
          SvgPicture.asset(
            Images.favorite,
            height: ScreenUtil().setHeight(200),
            placeholderBuilder: (context) => CircularProgressIndicator(),
          ),
          VerticalSpacing(100),
          CustomButton(
            isEnabled: true,
            isLoading: false,
            buttonColor: CustomButtonColor.primary,
            label: Strings.logInLabel,
            onTap: _controller.navigateToLoginScreen,
          ),
        ],
      ),
    );
  }
}
