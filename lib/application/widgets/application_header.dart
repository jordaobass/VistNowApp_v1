import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/images/images.dart';
import '../values/application_colors.dart';

class ApplicationHeader extends StatelessWidget {
  final Function onPressedSearch;
  final bool hasSearch;

  const ApplicationHeader({
    Key key,
    this.onPressedSearch,
    this.hasSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(40),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Image.asset(
                Images.logo,
                width: ScreenUtil().setWidth(200),
              ),
              SizedBox(),
            ],
          ),
          Visibility(
            visible: hasSearch,
            child: Positioned(
              bottom: ScreenUtil().setHeight(5),
              right: ScreenUtil().setHeight(10),
              child: IconButton(
                color: ApplicationColors.accent,
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: onPressedSearch,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
