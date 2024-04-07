
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../features/core/core_bindings.dart';
import '../features/core/core_view.dart';


part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.CORE,
      page: () => CoreTab(),
      binding: CoreBindings(),
      children: [],
    ),
    GetPage(
      name: Routes.FEATURED,
      page: () => Placeholder(),
      //binding: AuthBindings(),
      children: [],
    ),
    GetPage(
      name: Routes.MISSIONS,
      page: () => Placeholder(),
      //binding: EditProfileBinding(),
    ),
  ];
}
