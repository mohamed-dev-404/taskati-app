import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/functions/navigations.dart';
import 'package:taskati_app/core/utils/assets/app_assets.dart';
import 'package:taskati_app/features/complete_profile/complete_profile.dart';
import 'package:taskati_app/features/splash/widgets/animated_cross_fade_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    _startFadeAnimation();
    _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.logoJson,
            ),
            const Gap(2),
            AnimatedCrossFadeLogo(crossFadeState: crossFadeState),
          ],
        ),
      ),
    );
  }

  void _navigate() {
    Future.delayed(
      const Duration(
        seconds: 4,
        milliseconds: 620,
      ),
      () {
        if (!mounted) return;
        context.pushReplacement(const CompleteProfile());
      },
    );
  }

  void _startFadeAnimation() {
    Future.delayed(
      const Duration(milliseconds: 270),
      () {
        setState(() {
          crossFadeState = CrossFadeState.showSecond;
        });
      },
    );
  }
}
