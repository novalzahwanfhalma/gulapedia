import 'package:app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TombolRincian extends StatelessWidget {
  final VoidCallback onPressed;
  const TombolRincian({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        'Rincian',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
