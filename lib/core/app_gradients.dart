import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plantmanager/core/app_colors.dart';

class AppGradients {
  static final linear = LinearGradient(
    colors: [AppColors.white, AppColors.greenLight],
    transform: GradientRotation(1.0735 * pi),
  );

  static final backgroundEnviroments = LinearGradient(
    colors: [Color(0xFFF5FAF7), Color(0xFFF0F0F0)],
    transform: GradientRotation(1.1301 * pi),
  );
}
