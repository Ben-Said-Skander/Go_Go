import 'package:get/get.dart';
import 'package:pfa_application_1/bindings/post_bindings.dart';

import 'package:pfa_application_1/bindings/register_bindings.dart';
import 'package:pfa_application_1/bindings/user_bindings.dart';
import 'package:pfa_application_1/bindings/user_bindings.dart';
import 'package:pfa_application_1/bindings/user_bindings.dart';
import 'package:pfa_application_1/bindings/user_bindings.dart';

import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/splash_screen.dart';

import 'package:pfa_application_1/view/screens/driverSignUp.dart';

import 'package:pfa_application_1/view/screens/search%20drivers/search_drivers.dart';
import 'package:pfa_application_1/view/screens/onboarding_page.dart';

import 'package:pfa_application_1/view/screens/carpool%20request/carpool_request.dart';
import 'package:pfa_application_1/view/screens/reset%20password/forget_password.dart';
import 'package:pfa_application_1/view/screens/reset%20password/reset_password.dart';
import 'package:pfa_application_1/view/screens/reset%20password/verify_code.dart';

import 'package:pfa_application_1/view/screens/search%20page/search_page.dart';

import 'package:pfa_application_1/view/screens/update%20profile/updateEmail.dart';
import 'package:pfa_application_1/view/screens/update%20profile/updateName.dart';
import 'package:pfa_application_1/view/screens/update%20profile/updatePhone.dart';

import 'bindings/user_bindings.dart';
import 'view/screens/home.dart';

import 'view/screens/settings.dart';
import 'view/screens/signIn.dart';
import 'view/screens/signUp.dart';
import 'view/screens/userType.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.home, page: () => const Home(), bindings: [
    PostBindings(),UserBindings()
  ]),
  GetPage(
    name: AppRoute.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
      name: AppRoute.carpoolRequest,
      page: () => const CarpoolRequest(),
      binding: PostBindings()),
  GetPage(
      name: AppRoute.driverSignUp,
      page: () => const DriverSignUp(),
      binding: RegisterBindings()),
  GetPage(
      name: AppRoute.userType,
      page: () => const UserType(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.signIn,
      page: () => const SignIn(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.signup,
      page: () => const SignUp(),
      binding: RegisterBindings()),
  GetPage(
      name: AppRoute.settings,
      page: () => const Settings(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.forgotPassword,
      page: () => const ForgotPassword(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.resetPasswrod,
      page: () => const ResetPassword(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.verifyCode,
      page: () => const VerifyCode(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.searchDrivers,
      page: () => const SearchDriversPage(),
      bindings: [UserBindings(), PostBindings()]),
  GetPage(
      name: AppRoute.updateEmail,
      page: () => const UpdateEmail(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.updateName,
      page: () => const UpdateName(),
      binding: UserBindings()),
  GetPage(
      name: AppRoute.updatePhone,
      page: () => const UpdatePhone(),
      binding: UserBindings()),
];
