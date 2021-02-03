import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../application/adapters/permission.dart';
import '../../../../application/models/latitude_longitude.dart';
import '../../models/hotel_item.dart';
import '../../repository/home_repository.dart';
import '../../states/list_of_hotels_state.dart';

abstract class MapController {
  LatitudeLongitude get latitudeAndLongitude;
  bool get isLoading;
  Future<void> getPlaces();

  List<HotelItem> get listOfHotels;
  bool get isListInMaxLength;
}

class MapControllerImpl extends GetxController implements MapController {
  final PermissionAdapter _permissionAdapter;
  final HomeRepository _homeRepository;

  MapControllerImpl({
    @required PermissionAdapter permissionAdapter,
    @required HomeRepository homeRepository,
  })  : _permissionAdapter = permissionAdapter,
        _homeRepository = homeRepository;

  @override
  void onInit() async {
    await _permissionAdapter.requestLocalizationPermission();

    _currentUserPosition.value =
        await _permissionAdapter.getCurrentUserPosition();

    _loadingState.value = false;

    await getPlaces();
    super.onInit();
  }

  final _currentUserPosition = Rx<LatitudeLongitude>();
  final _loadingState = Rx<bool>(true);

  @override
  LatitudeLongitude get latitudeAndLongitude => _currentUserPosition.value;

  @override
  bool get isLoading => _loadingState.value;

  final _listOfHotelsState = Rx<ListOfHotelsState>(EmptyListOfHotelsState());

  final _lastLoadedListState =
      Rx<SuccessListOfHotelsState>(SuccessListOfHotelsState([]));

  final _isListInMaxLengthState = Rx<bool>(false);

  @override
  List<HotelItem> get listOfHotels {
    final value = _listOfHotelsState.value;

    if (value is SuccessListOfHotelsState) {
      return value.hotels;
    }

    return _lastLoadedListState.value.hotels;
  }

  @override
  bool get isListInMaxLength => _isListInMaxLengthState.value;

  @override
  Future<void> getPlaces() async {
    print('called');
    if (isListInMaxLength) return;

    var currentList = <HotelItem>[];

    final value = _listOfHotelsState.value;

    if (value is SuccessListOfHotelsState) {
      currentList.addAll(value.hotels);
      _lastLoadedListState.value = SuccessListOfHotelsState(currentList);
    }

    _listOfHotelsState.value = LoadingListOfHotelsState();

    try {
      var response = await _homeRepository.getAllHotels();
      currentList.addAll(response);
      _listOfHotelsState.value = SuccessListOfHotelsState(currentList);
      if (currentList.length == 100) {
        print('teste');
        _isListInMaxLengthState.value = true;
      }
    } on Exception catch (_) {
      print(_);
    }
  }
}
