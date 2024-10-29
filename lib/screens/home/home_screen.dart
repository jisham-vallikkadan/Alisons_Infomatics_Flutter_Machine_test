
import 'package:alisons_lnfomatics_flutter_machine_test/screens/home/widgets/banner.dart';
import 'package:alisons_lnfomatics_flutter_machine_test/screens/home/widgets/our_brand.dart';
import 'package:alisons_lnfomatics_flutter_machine_test/screens/home/widgets/suggested_for_you.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/product_model.dart';
import '../../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HomeProvider>(context, listen: false).getProductList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, items, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          leadingWidth: 80,
          leading: Image.asset('assets/Logo 2.png'),
          actions: [
            const Icon(Icons.search),
            SizedBox(
              width: 5.w,
            ),
            const Icon(Icons.favorite),
            SizedBox(
              width: 5.w,
            ),
            Stack(
              children: [
                const Icon(Icons.add_shopping_cart,
                    size: 30, color: Color(0XFF8A8A8A)),
                Positioned(
                    right: 3,
                    top: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 7,
                      child: Text(
                        (items.productList?.cartcount.toString() ?? ''),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: "Manrope",
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: items.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      CarouselBanner(
                        height: 250.h,
                        banners: items.productList?.banner1,
                      ),
                      OurBrand(
                        featuredbrand: items.productList?.featuredbrands,
                      ),
                      SuggestedForYou(
                        suggestedProducts: items.productList?.suggestedProducts,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselBanner(
                        height: 385.h,
                        banners: items.productList?.banner2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SuggestedForYou(
                        title: 'Bestsellers',
                        suggestedProducts: items.productList?.bestSeller,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Trending Categories',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Manrope"),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        children: List.generate(
                          items.productList?.categories!.length ?? 0,
                          (index) {
                            return SizedBox(
                              width: 105.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 135.h,
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://swan.alisonsnewdemo.online/images/category/${items.productList?.categories![index].category?.image}'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Text(
                                    '${items.productList?.categories![index].category?.name}' ??
                                        '',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Manrope"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      CarouselBanner(
                        title: 'Shop Exclusive Deals',
                        height: 385.h,
                        banners: items.productList?.banner3,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
