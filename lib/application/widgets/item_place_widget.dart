import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../values/application_colors.dart';
import '../values/dimensions.dart';
import '../values/text_styles.dart';
import 'spacings/vertical_spacing.dart';

class ItemPlaceWidget extends StatelessWidget {
  final String imageUrl;
  final Function onTap;
  final bool isLiked;
  final String title;
  final String valuePerDay;
  final String place;
  final String subtitle;
  final double rating;
  final Future<bool> Function(bool) onTapLike;

  const ItemPlaceWidget({
    Key key,
    this.imageUrl,
    this.onTap,
    this.onTapLike,
    this.isLiked,
    this.title,
    this.subtitle,
    this.valuePerDay,
    this.place,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(),
        _data(),
      ],
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                height: ScreenUtil().setHeight(140),
                width: Dimensions.fullScreenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 40,
                  width: Dimensions.fullScreenWidth / 3,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: ScreenUtil().setWidth(20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      placeholder: (__, _) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _data() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _informationsOfPlace(),
          LikeButton(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
            ),
            size: ScreenUtil().setHeight(25),
            isLiked: isLiked,
            onTap: onTapLike,
          ),
        ],
      ),
    );
  }

  Widget _informationsOfPlace() {
    return Container(
      width: Dimensions.fullScreenWidth * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacing(4),
          Text(
            title.toUpperCase(),
            style: TextStyles.itemPlaceTitle,
          ),
          VerticalSpacing(2),
          Text(
            subtitle,
            style: TextStyles.itemPlaceSubtitle,
          ),
          VerticalSpacing(2),
          Row(
            children: [
              Text(
                valuePerDay,
                style: TextStyles.itemPlaceValue,
              ),
              Container(
                height: 4,
                width: 4,
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(8),
                ),
                decoration: BoxDecoration(
                  color: ApplicationColors.black,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                place,
                style: TextStyles.itemPlaceState,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
