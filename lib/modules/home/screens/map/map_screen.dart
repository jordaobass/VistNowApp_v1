import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../application/values/application_colors.dart';
import '../../../../application/values/strings.dart';
import '../../../../application/values/text_styles.dart';
import '../../../../application/widgets/application_header.dart';
import '../../../../application/widgets/item_place_widget.dart';
import '../../../../application/widgets/spacings/vertical_spacing.dart';
import 'map_controller.dart';

class MapScreen extends StatefulWidget {
  final MapController _controller;
  final Function onPressedSearch;

  const MapScreen({
    Key key,
    @required MapController controller,
    @required this.onPressedSearch,
  })  : _controller = controller,
        super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  MapController _controller;
  GoogleMapController _googleMapController;

  @override
  void initState() {
    _controller = widget._controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _map(),
          _loadingWidget(),
          _draggableBottomSheet(context),
          _header(),
        ],
      ),
    );
  }

  Widget _header() {
    return ApplicationHeader(
      onPressedSearch: widget.onPressedSearch,
    );
  }

  Widget _map() {
    return Obx(() {
      if (_controller.isLoading) {
        return SizedBox();
      }

      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            _controller.latitudeAndLongitude.latitude,
            _controller.latitudeAndLongitude.longitude,
          ),
          zoom: 15,
        ),
        onMapCreated: onCreate,
        myLocationEnabled: true,
        mapType: MapType.terrain,
        markers: {},
      );
    });
  }

  Widget _loadingWidget() {
    return Obx(() {
      if (!_controller.isLoading) {
        return SizedBox();
      }

      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitFadingFour(
              color: ApplicationColors.accent,
              size: 50.0,
              controller: AnimationController(
                vsync: this,
                duration: const Duration(milliseconds: 1200),
              ),
            ),
            VerticalSpacing(20),
            Container(
              width: ScreenUtil().setWidth(250),
              child: Text(
                Strings.loadingLocalizationMessage,
                style: TextStyles.informationText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _draggableBottomSheet(BuildContext context) {
    return Obx(() {
      if (_controller.isLoading) {
        return Container();
      }

      return DraggableScrollableSheet(
        maxChildSize: 0.9,
        minChildSize: 0.4,
        initialChildSize: 0.5,
        builder: (context, myscrollController) {
          return Container(
            decoration: BoxDecoration(
              color: ApplicationColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setHeight(25)),
                topRight: Radius.circular(ScreenUtil().setHeight(25)),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  alignment: Alignment.center,
                  child: Container(
                    height: 3,
                    width: ScreenUtil().setWidth(100),
                    color: ApplicationColors.grey,
                  ),
                ),
                Expanded(
                  child: _listOfHotels(myscrollController),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _listOfHotels(ScrollController myscrollController) {
    return Obx(() {
      return LazyLoadScrollView(
        onEndOfPage:
            _controller.isListInMaxLength ? () {} : _controller.getPlaces,
        child: Obx(() {
          return ListView.separated(
            controller: myscrollController,
            itemCount: _controller.listOfHotels.length + 1,
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10),
              top: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setWidth(100),
            ),
            separatorBuilder: (_, __) => VerticalSpacing(30),
            itemBuilder: (context, index) {
              if (index == _controller.listOfHotels.length) {
                if (_controller.isListInMaxLength) {
                  return SizedBox();
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var item = _controller.listOfHotels[index];

              return ItemPlaceWidget(
                rating: item.rating,
                isLiked: item.isLiked,
                imageUrl: item.imageUrl,
                title: item.title,
                place: item.place,
                subtitle: item.subtitle,
                valuePerDay: item.valuePerDay,
                onTap: () {},
                onTapLike: (currentValue) async {
                  return !currentValue;
                },
              );
            },
          );
        }),
      );
    });
  }

  void onCreate(GoogleMapController controller) {
    setState(() {
      _googleMapController = controller;
    });
  }
}
