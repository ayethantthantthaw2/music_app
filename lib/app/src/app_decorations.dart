import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

class AppDecorations {
  static BoxDecoration gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        AppColors.primaryColor.shade800.withOpacity(0.8),
        AppColors.primaryColor.shade200.withOpacity(0.8),
      ]));
}
