import 'package:meta/meta.dart' show required;
import '../models/hotel_item.dart';

abstract class HomeRepository {
  Future<List<HotelItem>> getAllHotels();
  Future<List<HotelItem>> getFilteredHotels({
    @required DateTime checkIn,
    @required DateTime checkOut,
    @required int adults,
    @required int children,
  });
}

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<HotelItem>> getAllHotels() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      HotelItem(
        imageUrl:
            'https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
        isLiked: true,
        rating: 4.5,
        place: 'Rio de Janeiro',
        title: 'Hotel Ibis',
        subtitle: 'Quarto King',
        valuePerDay: '450/diária',
      ),
      HotelItem(
        imageUrl: 'https://media.nomadicmatt.com/hotelreview1a.jpg',
        isLiked: false,
        rating: 4.0,
        place: 'Rio de Janeiro',
        title: 'Hotel Ibis',
        subtitle: 'Quarto King',
        valuePerDay: '450/diária',
      ),
      HotelItem(
        imageUrl:
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1191,w_2121,x_0,y_223/f_auto,q_auto,w_1100/v1555272928/shape/mentalfloss/50569-istock-486178472.jpg',
        isLiked: false,
        rating: 2.5,
        place: 'Rio de Janeiro',
        title: 'Hotel Ibis',
        subtitle: 'Quarto King',
        valuePerDay: '450/diária',
      ),
      HotelItem(
        imageUrl:
            'https://cf.bstatic.com/images/hotel/max1024x768/167/167534297.jpg',
        isLiked: false,
        rating: 5.0,
        place: 'Rio de Janeiro',
        title: 'Hotel Ibis',
        subtitle: 'Quarto King',
        valuePerDay: '450/diária',
      ),
      HotelItem(
        imageUrl:
            'https://media-cdn.tripadvisor.com/media/photo-s/12/4e/56/57/standard-hotel-room-layout.jpg',
        isLiked: true,
        rating: 1.0,
        place: 'Rio de Janeiro',
        title: 'Hotel Ibis',
        subtitle: 'Quarto King',
        valuePerDay: '450/diária',
      ),
    ];
  }

  @override
  Future<List<HotelItem>> getFilteredHotels({
    @required DateTime checkIn,
    @required DateTime checkOut,
    @required int adults,
    @required int children,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<HotelItem>> getAllHotels() {
    // TODO: implement getAllHotels
    throw UnimplementedError();
  }

  @override
  Future<List<HotelItem>> getFilteredHotels({
    @required DateTime checkIn,
    @required DateTime checkOut,
    @required int adults,
    @required int children,
  }) {
    // TODO: implement getFilteredHotels
    throw UnimplementedError();
  }
}
