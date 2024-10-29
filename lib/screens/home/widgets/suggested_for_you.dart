import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/product_model.dart';

class SuggestedForYou extends StatelessWidget {
  final List<BestSeller>? suggestedProducts;
  final String? title;
  const SuggestedForYou({super.key, this.suggestedProducts,this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            title??'Suggested For You',
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
          height: 270.h,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 230.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://swan.alisonsnewdemo.online/images/product/${suggestedProducts![index].image}'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Text(
                      suggestedProducts![index].name ?? '',
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Manrope"),
                    ),
                    Text(
                      '₹ ${suggestedProducts![index].price}',
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Manrope"),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: suggestedProducts!.length ?? 0),
        )
      ],
    );
  }
}
