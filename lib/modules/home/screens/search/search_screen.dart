import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../application/helpers/formatter/date_formatter.dart';
import '../../../../application/values/application_colors.dart';
import '../../../../application/values/dimensions.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/values/text_styles.dart';
import '../../../../application/widgets/application_header.dart';
import '../../../../application/widgets/buttons/custom_button.dart';
import '../../../../application/widgets/spacings/horizontal_spacing.dart';
import '../../../../application/widgets/spacings/vertical_spacing.dart';
import '../../../../application/widgets/text_fields/search_text_field.dart';
import '../../components/custom_circle_button.dart';
import '../../components/custom_date_field.dart';
import '../../models/operation_type.dart';
import 'search_controller.dart';

class SearchScreen extends StatefulWidget {
  final SearchController _controller;

  const SearchScreen({
    Key key,
    @required SearchController controller,
  })  : _controller = controller,
        super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController _controller;

  final _checkInTextEditingController = TextEditingController();
  final _checkOutTextEditingController = TextEditingController();

  @override
  void initState() {
    var getCheckInFromState = PageStorage.of(context)?.readState(
      context,
      identifier: ValueKey(
        "checkInKey",
      ),
    );

    var getCheckOutFromState = PageStorage.of(context)?.readState(
      context,
      identifier: ValueKey('checkoutKey'),
    );

    if (getCheckInFromState != null) {
      _checkInTextEditingController.text =
          DateFormatter.fullDate(getCheckInFromState);
    }

    if (getCheckOutFromState != null) {
      _checkOutTextEditingController.text =
          DateFormatter.fullDate(getCheckOutFromState);
    }

    _controller = widget._controller;
    super.initState();
  }

  @override
  void dispose() {
    _checkInTextEditingController.dispose();
    _checkOutTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.white,
      body: Container(
        child: Column(
          children: [
            _header(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return ApplicationHeader(
      hasSearch: false,
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(10),
            SearchTextField(
              hintText: Strings.whereAreYouGoing,
            ),
            VerticalSpacing(30),
            _checkInAndCheckOut(),
            VerticalSpacing(30),
            ..._guests(),
            Spacer(),
            CustomButton(
              label: Strings.searchHotels,
              onTap: () {},
              // onTap: _controller.getFilteredHotels, //Will be implemented soon
            ),
            VerticalSpacing(80),
          ],
        ),
      ),
    );
  }

  Widget _checkInAndCheckOut() {
    var allDaysOfWeek = [0, 1, 2, 3, 4, 5, 6, 7];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Obx(
            () => CustomDateField(
              label: Strings.checkIn,
              textEditingController: _checkInTextEditingController,
              availableWeekdays: allDaysOfWeek,
              lastDate: _controller.lastDate,
              onSelectedDateCallback: (newDate) {
                _checkInTextEditingController.text =
                    DateFormatter.fullDate(newDate);

                PageStorage.of(context)?.writeState(
                  context,
                  newDate,
                  identifier: ValueKey("checkInKey"),
                );

                _controller.updateInitialDate(newDate);
              },
            ),
          ),
        ),
        HorizontalSpacing(20),
        Flexible(
          child: Obx(
            () => CustomDateField(
                initialDate: _controller.initialDate,
                textEditingController: _checkOutTextEditingController,
                label: Strings.checkOut,
                availableWeekdays: allDaysOfWeek,
                onSelectedDateCallback: (newDate) {
                  _checkOutTextEditingController.text =
                      DateFormatter.fullDate(newDate);

                  PageStorage.of(context)?.writeState(
                    context,
                    newDate,
                    identifier: ValueKey('checkoutKey'),
                  );

                  _controller.updateLastDate(newDate);
                }),
          ),
        ),
      ],
    );
  }

  List<Widget> _guests() => [
        Text(
          Strings.guests,
          style: TextStyles.genericRedLabel,
        ),
        VerticalSpacing(10),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.adults,
                  style: TextStyles.filterLabel,
                ),
                Row(
                  children: [
                    CustomCircleButton(
                      icon: Icons.add,
                      onTap: () => _controller.updateAdult(OperationType.add),
                    ),
                    HorizontalSpacing(10),
                    Obx(
                      () => Text(
                        _controller.adultsValue,
                        style: TextStyles.filterLabel,
                      ),
                    ),
                    HorizontalSpacing(10),
                    CustomCircleButton(
                      icon: Icons.remove,
                      onTap: () =>
                          _controller.updateAdult(OperationType.subtract),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.children,
                  style: TextStyles.filterLabel,
                ),
                Row(
                  children: [
                    CustomCircleButton(
                      icon: Icons.add,
                      onTap: () =>
                          _controller.updateChildren(OperationType.add),
                    ),
                    HorizontalSpacing(10),
                    Obx(
                      () => Text(
                        _controller.childrenValue,
                        style: TextStyles.filterLabel,
                      ),
                    ),
                    HorizontalSpacing(10),
                    CustomCircleButton(
                      icon: Icons.remove,
                      onTap: () =>
                          _controller.updateChildren(OperationType.subtract),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}
