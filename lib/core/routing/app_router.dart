import 'package:flutter/material.dart';
import 'package:sayaraty/features/onboarding/second_onboarding_screen.dart';
import '../../features/language_selection/select_language_screen.dart';
import '../../features/onboarding/first_onboarding_screen.dart';
import '../../features/role_selection/user_role_selection.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case firstOnboarding:
        return MaterialPageRoute(builder: (_) => FirstOnboardingScreen());
      case secondOnboarding:
        return MaterialPageRoute(builder: (_) => SecondOnboardingScreen());
      case selectLanguage:
        return MaterialPageRoute(builder: (_) => LanguageSelectionScreen());
      case selectRole:
        return MaterialPageRoute(builder: (_) => UserRoleSelection());
      case home:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case landing:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case login:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case register:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case onboarding:
        return MaterialPageRoute(builder: (_) => const Text("Home"));
      case profile:
        return MaterialPageRoute(builder: (_) => const Text("Home"));

      default:
        return MaterialPageRoute(
          builder: (_) => Center(child: const Text("No Route")),
        );
    }
  }

  // Routes names

  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const resetPassword = '/reset-password';
  static const landing = '/landing';
  static const selectLanguage = '/select-language';
  static const selectRole = '/select-role';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const profile = '/profile';
  static const settings = '/settings';
  static const about = '/about';
  static const privacy = '/privacy';
  static const terms = '/terms';
  static const contact = '/contact';
  static const onBoarding = '/onboarding';
  static const firstOnboarding = '/first-onboarding';
  static const secondOnboarding = '/second-onboarding';
}
