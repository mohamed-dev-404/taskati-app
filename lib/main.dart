import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/assets/app_assets.dart';
import 'package:taskati_app/core/utils/colors/app_colors.dart';
import 'package:taskati_app/core/utils/theme/app_themes.dart';
import 'package:taskati_app/features/splash/view/splash_view.dart';

void main() {
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColors.backgroundColor,
              ),
              Image.asset(
                AppAssets.bg,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              child ?? Container(),
            ],
          ),
        );
      },
      home: const SplashView(),
    );
  }
}
