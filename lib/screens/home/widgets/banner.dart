import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/product_model.dart' as banner;

class CarouselBanner extends StatelessWidget {
  final double height;
  final String? title;
  final List<banner.Banner>? banners;
  CarouselBanner({super.key, required this.height, this.banners, this.title});
  final CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title == null
            ? const SizedBox()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Manrope"),
                  ),
                ),
              ),
        CarouselSlider(
          carouselController: controller,
          items: banners
              ?.map(
                (e) => SizedBox(
                    width: double.infinity,
                    height: height ?? 135,
                    child: Stack(
                      children: [
                        Image.network(
                          'https://swan.alisonsnewdemo.online/images/banner/${e.image}' ??
                              "",
                          fit: BoxFit.fill,
                        ),
                      ],
                    )),
              )
              .toList(),
          options: CarouselOptions(
              onPageChanged: (index, _) async {},
              height: height,
              initialPage: 0,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlayCurve: Curves.easeOut,
              autoPlay: true),
        ),
      ],
    );
  }
}
