import 'package:get/get.dart';

import 'package:cadastro_di/app/modules/home/bindings/home_binding.dart';
import 'package:cadastro_di/app/modules/home/views/home.dart';
import 'package:cadastro_di/app/modules/login/bindings/login_binding.dart';
import 'package:cadastro_di/app/modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.upToDown,
    ),
  ];
}
