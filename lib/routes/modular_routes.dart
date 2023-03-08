// ignore_for_file: implementation_imports, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/features/auth/presentation/pages/splash_screen.dart';
import 'package:gp/routes/routes_names.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';

List<ModularRoute> modularRoutes = <ChildRoute<dynamic>>[
  ChildRoute<dynamic>(
    AppRoutes.start,
    child: (_, ModularArguments args) => const SplashScreen(),
    transition: TransitionType.fadeIn,
  ),ChildRoute<dynamic>(
    AppRoutes.onBoarding,
    child: (_, ModularArguments args) => const OnboardingScreen(),
    transition: TransitionType.fadeIn,
  ),
];
