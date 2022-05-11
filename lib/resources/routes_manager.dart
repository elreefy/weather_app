// import 'package:flutter/material.dart';
// import 'package:weather_app/pages/home_page.dart';
// import 'color_manager.dart';
// import 'strings_manager.dart';
// import 'styles_manager.dart';
//
// class Routes {
//   static const String splashRoute = "/";
//   static const String onBoardingRoute = "/onboarding";
//   static const String loginRoute = "/login";
//   static const String registerRoute = "/register";
//   static const String forgotPasswordRoute = "/forgotPassword";
//   static const String mainRoute = "/main";
//   static const String storeDetailsRoute = "/storeDetails";
// }
//
// class RoutesGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => HomePage());
//       default:
//         return undefinedRoute();
//     }
//   }
//
//   static Route<dynamic> undefinedRoute() => MaterialPageRoute(
//         builder: (_) => Scaffold(
//           appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
//           body: Center(
//             child: Text(
//               AppStrings.noRouteFound,
//               style: getMediumStyle(
//                 color: ColorManager.error,
//               ),
//             ),
//           ),
//         ),
//       );
// }
