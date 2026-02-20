import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/styles/text_styles.dart';

class AnimatedCrossFadeLogo extends StatelessWidget {
  const AnimatedCrossFadeLogo({
    super.key,
    required this.crossFadeState,
  });

  final CrossFadeState crossFadeState;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(
        seconds: 2,
        milliseconds: 700,
      ),
      crossFadeState: crossFadeState,
      firstChild: const SizedBox(
        width: 30,
        height: 30,
      ),
      secondChild: const Column(
        children: [
          Text(
            'Taskati',
            style: AppStyles.headline,
          ),
          Gap(16),
          Text(
            'It’s time to get organized',
            style: AppStyles.caption1,
          ),
        ],
      ),
    );
  }
}
