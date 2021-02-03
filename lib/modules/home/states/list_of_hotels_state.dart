import 'package:visit_now/modules/home/models/hotel_item.dart';

abstract class ListOfHotelsState {}

class SuccessListOfHotelsState implements ListOfHotelsState {
  final List<HotelItem> hotels;

  SuccessListOfHotelsState(this.hotels);
}

class EmptyListOfHotelsState implements ListOfHotelsState {}

class LoadingListOfHotelsState implements ListOfHotelsState {}
