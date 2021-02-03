import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visit_now/application/values/dimensions.dart';

import '../values/application_colors.dart';

class RoundedPage extends StatelessWidget {
  final Widget child;

  const RoundedPage({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.fullScreenWidth,
        decoration: BoxDecoration(
          color: ApplicationColors.primary,
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setHeight(20)),
                topRight: Radius.circular(ScreenUtil().setHeight(20)),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     height: Dimensions.fullScreenHeight,
    //     color: ApplicationColors.primary,
    //     child: SafeArea(
    //       top: true,
    //       bottom: true,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(ScreenUtil().setHeight(20)),
    //             topRight: Radius.circular(ScreenUtil().setHeight(20)),
    //           ),
    //         ),
    //         child: child,
    //       ),
    //     ),
    //   ),
    // );
  }
}
