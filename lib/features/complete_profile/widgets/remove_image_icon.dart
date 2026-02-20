import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/assets/app_assets.dart';
import 'package:taskati_app/core/utils/colors/app_colors.dart';
import 'package:taskati_app/core/widgets/custom_svg_picture.dart';

class RemoveImageIcon extends StatelessWidget {
  const RemoveImageIcon({
    super.key,
    required this.onTap,
    this.bgColor = AppColors.backgroundColor,
  });

  final Function() onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: bgColor,
        child: const CustomSvgPicture(
          path: AppAssets.deleteSvg,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
