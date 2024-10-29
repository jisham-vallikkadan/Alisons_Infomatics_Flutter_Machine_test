import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPress;
  final bool isLoading;
  final String text;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Size? size;
  final Widget? leftIcon;

  const CustomButton(
      {this.onPress,
      required this.text,
      super.key,
      this.bgColor,
      this.borderColor,
      this.isLoading = false,
      this.textStyle,
      this.textColor,
      this.leftIcon,
      this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: size ?? Size(ScreenUtil().screenWidth, 48),
        backgroundColor: bgColor ?? Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: borderColor ?? Colors.red,)),
      ),
      onPressed: isLoading ? null : onPress,
      child: isLoading
          ? const SizedBox(
              height: 48,
              child:
                  Center(child: CircularProgressIndicator(color: Colors.white)))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leftIcon ?? const SizedBox(),
                SizedBox(width: leftIcon == null ? 0 : 10),
                Text(text,
                    style: textStyle ??
                        TextStyle(
                            color: textColor ?? Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Manrope")),
              ],
            ),
    );
  }
}
