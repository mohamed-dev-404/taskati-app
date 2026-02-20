import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/styles/text_styles.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'profile view',
          style: AppStyles.headline,
        ),
      ),
    );
  }
}
