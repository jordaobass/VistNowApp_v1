import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

import '../../models/operation_type.dart';
import '../../repository/home_repository.dart';

abstract class SearchController {
  String get childrenValue;
  String get adultsValue;
  DateTime get lastDate;
  DateTime get initialDate;

  void updateAdult(OperationType type);
  void updateChildren(OperationType type);
  void updateInitialDate(DateTime newDate);
  void updateLastDate(DateTime newDate);
  Future<void> getFilteredHotels();
}

class SearchControllerImpl extends GetxController implements SearchController {
  final HomeRepository _homeRepository;

  SearchControllerImpl({
    @required HomeRepository repository,
  }) : _homeRepository = repository;

  final _childrenState = Rx<int>(0);
  final _adultsState = Rx<int>(0);
  final _initialDate = Rx<DateTime>();
  final _lastDate = Rx<DateTime>();

  @override
  String get adultsValue => _adultsState.value.toString();

  @override
  String get childrenValue => _childrenState.value.toString();

  @override
  void updateAdult(OperationType type) {
    switch (type) {
      case OperationType.add:
        _adultsState.value++;
        print(_adultsState.value);
        break;
      case OperationType.subtract:
        if (_adultsState.value == 0) {
          return;
        }
        _adultsState.value--;
        break;
      default:
        return;
    }
  }

  @override
  void updateChildren(OperationType type) {
    switch (type) {
      case OperationType.add:
        _childrenState.value++;
        break;
      case OperationType.subtract:
        if (_childrenState.value == 0) {
          return;
        }
        _childrenState.value--;
        break;
      default:
        return;
    }
  }

  @override
  DateTime get initialDate => _initialDate.value;

  @override
  DateTime get lastDate => _lastDate.value;

  @override
  void updateInitialDate(DateTime newDate) {
    _initialDate.value = newDate;
  }

  @override
  void updateLastDate(DateTime newDate) {
    _lastDate.value = newDate;
  }

  @override
  Future<void> getFilteredHotels() {
    var response = _homeRepository.getFilteredHotels(
      adults: _adultsState.value,
      children: _childrenState.value,
      checkIn: _initialDate.value,
      checkOut: _lastDate.value,
    );
    //TODO: pass this Future to the next screen
  }
}
