import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpacing extends StatelessWidget {
  final double size;

  const HorizontalSpacing(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(size),
    );
  }
}
