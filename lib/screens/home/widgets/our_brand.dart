import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/product_model.dart';

class OurBrand extends StatelessWidget {
  final List<Featuredbrand>? featuredbrand;
  const OurBrand({super.key, this.featuredbrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Our Brands',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Manrope"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 150,
                      width: 115.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://swan.alisonsnewdemo.online/images/product/${featuredbrand![index].image}')),
                      ),
                      child: Center(
                        child: Text(
                          featuredbrand![index].name ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Manrope"),
                        ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: featuredbrand!.length??0),
        )
      ],
    );
  }
}
