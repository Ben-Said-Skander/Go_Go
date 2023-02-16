import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/view/screens/onboarding_page.dart';
import 'package:pfa_application_1/view/screens/search_page.dart';
import 'package:pfa_application_1/view/screens/test.dart';
import 'view/screens/home.dart';

import 'view/screens/add_new_medicine.dart';
import 'view/screens/blog/add_new_blog.dart';
import 'view/screens/blog/blog.dart';
import 'view/screens/blog/help_blog.dart';
import 'view/screens/blog/missing_drug_blog.dart';
import 'view/screens/blog/see_all.dart';
import 'view/screens/blog_details.dart';
import 'view/screens/medicine_details.dart';
import 'view/screens/reminder.dart';
import 'view/screens/settings.dart';
import 'view/screens/signIn.dart';
import 'view/screens/signUp.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.details, page: () => const Details()),
  GetPage(name: AppRoute.addMedicine, page: () => const AddMedicine()),
  GetPage(name: AppRoute.reminder, page: () => const Reminders()),
  GetPage(name: AppRoute.signIn, page: () => const SignIn()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.settings, page: () => const Settings()),
  GetPage(name: AppRoute.blog, page: () => const Blog()),
  GetPage(name: AppRoute.helpBlog, page: () => const HelpBlog()),
  GetPage(name: AppRoute.missingBlog, page: () => const MissingBlog()),
  GetPage(name: AppRoute.blogdetails, page: () => const BlogDetails()),
  GetPage(name: AppRoute.addBlog, page: () => const AddBlog()),
  GetPage(name: AppRoute.seeAll, page: () => const SeeAll()),
  GetPage(name: AppRoute.searchPage, page: () => const SearchPage()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
    GetPage(name: AppRoute.test, page: () => const test()),
];
