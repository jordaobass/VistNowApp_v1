import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../application/helpers/formatter/date_formatter.dart';
import '../../../application/values/application_colors.dart';
import '../../../application/values/strings.dart';
import '../../../application/values/text_styles.dart';

class CustomDateField extends StatefulWidget {
  final String label;
  final Function(DateTime) onSelectedDateCallback;
  final List<int> availableWeekdays;
  final TextEditingController textEditingController;
  final DateTime initialDate;
  final DateTime lastDate;

  const CustomDateField({
    Key key,
    @required this.label,
    this.availableWeekdays,
    this.onSelectedDateCallback,
    this.initialDate,
    this.lastDate,
    @required this.textEditingController,
  }) : super(key: key);

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _datePicker(),
      ],
    );
  }

  Widget _datePicker() {
    return Stack(
      children: [
        TextField(
          key: widget.key,
          controller: widget.textEditingController,
          onTap: showCustomDatePicker,
          showCursor: false,
          readOnly: true,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyles.textFieldInput,
          decoration: InputDecoration(
            hintStyle: TextStyles.filterLabel,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(9),
              right: ScreenUtil().setWidth(35),
            ),
            hintText: Strings.datePickerHintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ApplicationColors.lightGrey,
                width: 1,
              ),
            ),
          ),
        ),
        _label(),
        _icon(),
      ],
    );
  }

  Widget _label() {
    return Text(
      widget.label,
      style: TextStyles.genericRedLabel,
    );
  }

  Widget _icon() {
    return Positioned(
      right: 10,
      top: ScreenUtil().setHeight(18),
      child: Icon(
        Icons.date_range,
        color: ApplicationColors.accent,
      ),
    );
  }

  void showCustomDatePicker() {
    var initialDate = widget.initialDate ?? DateTime.now();
    final fiveYears = 365 * 5;

    while (!widget.availableWeekdays.contains(initialDate.weekday)) {
      initialDate = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day + 1,
      );
    }
    showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: widget.initialDate ?? DateTime.now(),
        lastDate: widget.lastDate ??
            DateTime.now().add(
              Duration(days: fiveYears),
            ),
        selectableDayPredicate: (date) {
          return widget.availableWeekdays.contains(date.weekday);
        }).then(
      (dateSelected) {
        if (dateSelected is DateTime) {
          widget.onSelectedDateCallback(dateSelected);
        }
      },
    );
  }
}
