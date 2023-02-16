import 'package:flutter/material.dart';
import 'package:test_work/core/style.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text(errorMessage,style: AppTextStyle.defaultTextStyle,)),
    );
  }
}
