import 'package:flutter/material.dart';

abstract class AppColors{

  static const primary = Colors.black;
  static const contrast = Colors.white;

  static const backGround = Color(0xCDECEFEB);
  static const content = Color(0x742C2B2B);

}


abstract class AppTextStyle{

  static const defaultTextStyle = TextStyle(fontSize: 18.0,color: AppColors.primary,fontWeight: FontWeight.w600);
}

abstract class AppTheme{
  static BoxShadow shadow = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 4,
    color: const Color(0xFF030303).withOpacity(0.8),
  );
}

abstract class AppBorderRadius{
  static const BorderRadius defaultBorderRadius = BorderRadius.all(Radius.circular(20.0));
}