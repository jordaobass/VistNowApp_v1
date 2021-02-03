import 'package:flutter/material.dart';

import '../../../../application/values/dimensions.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/widgets/buttons/custom_button.dart';
import 'pre_login_controller.dart';

class PreLoginScreen extends StatelessWidget {
  final PreLoginController _controller;

  const PreLoginScreen({
    Key key,
    @required PreLoginController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
        height: Dimensions.fullScreenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              isEnabled: true,
              isLoading: false,
              buttonColor: CustomButtonColor.primary,
              label: Strings.logInLabel,
              onTap: _controller.navigateToLoginScreen,
            ),
          ],
        ),
      ),
    );
  }
}
