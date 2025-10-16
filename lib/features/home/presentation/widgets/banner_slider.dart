import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/images/banner2.png',
    'assets/images/banner.png',
    'assets/images/banner3.png',
  ];

  BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 151.h,
         autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: bannerImages.map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
