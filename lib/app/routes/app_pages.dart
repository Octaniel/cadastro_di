import 'package:cadastro_di/app/modules/home/views/home.dart';
import 'package:get/get.dart';

import 'package:cadastro_di/app/modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
  ];
}
