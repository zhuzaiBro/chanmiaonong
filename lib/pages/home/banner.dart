import 'package:chanmiaonong/components/swiper/swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  final List<dynamic> bannerData;

  HomeBanner({Key? key, required this.bannerData}) : super(key: key);

  @override
  State<HomeBanner> createState() => _BannerState();
}

class _BannerState extends State<HomeBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 120.h,
      margin: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 8.h,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.hardEdge,
      child: Swiper(imgs: widget.bannerData),
    );
  }
}
