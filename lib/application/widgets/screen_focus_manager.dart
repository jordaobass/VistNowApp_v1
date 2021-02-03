import 'package:flutter/material.dart';

class ScreenFocusManager extends StatelessWidget {
  final Widget child;

  const ScreenFocusManager({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _removeFocusWhenTapOutside(context),
      child: child,
    );
  }

  void _removeFocusWhenTapOutside(BuildContext context) {
    final _currentFocus = FocusScope.of(context);

    var checkIfHasFocusInSomeChild =
        !_currentFocus.hasPrimaryFocus && _currentFocus.focusedChild != null;

    if (checkIfHasFocusInSomeChild) {
      _currentFocus.focusedChild.unfocus();
    }
  }
}
