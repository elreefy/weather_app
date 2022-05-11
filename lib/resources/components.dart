import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dividerSeparator() => Divider(
      thickness: 0.3,
      color: Colors.deepOrangeAccent
    );

//<editor-fold desc='Default FormField'>
Widget defaultFormField({
  required TextEditingController controller,
  FocusNode? focusNode,
  required TextInputType keyboardType,
  String? Function(String?)? validate,
  VoidCallback? onTap,
  ValueChanged<String>? onSubmit,
  VoidCallback? suffixPressed,
  Function(String?)? onChanged,
  // IconData? prefixIcon,
  double borderRadius = 20,
  required String hint,
  IconData? suffixIcon,
  bool isPassword = false,
  // required bool isRtl,
}) =>
    TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintStyle:TextStyle(
          height: 1.0,
        ) ,
        hintText: hint,
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: Colors.deepOrangeAccent.withOpacity(0.8),
        // ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: Colors.deepOrangeAccent.withOpacity(0.8),
                ),
              )
            : null,
      ),
      validator: validate,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      style: TextStyle(color: Colors.deepOrangeAccent, letterSpacing: 1),
    );
//</editor-fold>

// Widget buildProgressIndicator() => Center(
//         child: CircularProgressIndicator(
//       color: Colors.deepOrangeAccentryColor,
//     ));
// Widget buildSearchLoadingIndicator() => Center(
//       child: Container(
//         width: 150,
//         child: LoadingIndicator(
//             indicatorType: Indicator.ballSpinFadeLoader,
//             colors: [
//               Colors.deepOrangeAccent,
//               Colors.deepOrangeAccent
//               Colors.rdeepOrangeAccentColors.lightBlue,
//               Colors.purpleAccent,
//               Color(0xffF05454),
//               Color(0xffFEC260),
//               Color(0xffFFC100),
//             ],
//             strokeWidth: 2,
//             pathBackgroundColor: Colors.black),
//       ),
//     );
// Widget buildProgressIndicator() => Center(
//       child: Container(
//         width: 100,
//         height: 40,
//         child: LoadingIndicator(
//             indicatorType: Indicator.ballBeat,
//             colors: [
//               Colors.deepOrangeAccent,
//               Colors.deepOrangeAccent
//               Colors.rdeepOrangeAccentColors.lightBlue,
//               Colors.purpleAccent,
//               Color(0xffF05454),
//               Color(0xffFEC260),
//               Color(0xffFFC100),
//             ],
//             strokeWidth: 2,
//             pathBackgroundColor: Colors.black),
//       ),
//     );

// Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateTo({context, widget}) => Navigator.push(
    context,
    PageRouteBuilder(transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,
        Widget child) {
      var begin = Offset(1, 0);
      var end = Offset(0, 0);
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: widget,
      );
    }, pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secAnimation) {
      return widget;
    }));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

// void showToast({
//   required String msg,
//   required ToastStates state,
//   double fontSize = 16,
//   int seconds = 5,
// }) =>
//     BotToast.showText(
//         text: msg,
//         duration: Duration(seconds: seconds),
//         contentColor: toastColor(state),
//         clickClose: true,
//         align: Alignment(0, -0.9));

// enum ToastStates { SUCCESS, ERROR, WARNING }
//
// Color toastColor(ToastStates state) {
//   switch (state) {
//     case ToastStates.SUCCESS:
//       return Colors.green;
//     case ToastStates.ERROR:
//       return Colors.red;
//     case ToastStates.WARNING:
//       return Colors.yellow;
//   }
// }

// Widget myDivider() => Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     );

Widget primaryButton({
  required String text,
  required VoidCallback onPressed,
  double height = 60,
  double width = 250.0,
  Color? background,
  Color? textColor,
  double radius = 30,
  bool isUpperCase = true,
  double fontSize = 18,
  colors,
}) =>
    Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(radius),
        // gradient: LinearGradientPainter(
        //   colorSpace: ColorSpace.oklab,
        //   colors: colors ??
        //       [
        //     //    Color(0xffF05454),
        //      Colors.deepOrangeAccent,
        //      Colors.deepOrangeAccent,
        //      Colors.deepOrangeAccent,
        //    //  Colors.deepOrangeAccent,
        //       ],
        // ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            fontSize: fontSize,
          ),
        ),
      ),
    );

Widget divider() => Divider(
      color: Colors.deepOrangeAccent,
      height: 20,
      thickness: 0.5,
      indent: 0,
      endIndent: 0,
    );
// Widget buildIconWithNumber({
//   required bool condition,
//   number,
//   icon,
//   iconColor,
//   double size = 30,
//   double radius = 12,
//   double fontSize = 13,
//   VoidCallback? onPressed,
//   alignment = const Alignment(1.6, -0.8),
// }) =>
//     Column(
//       children: [
//         Stack(
//           alignment: alignment,
//           children: [
//             IconButton(
//               onPressed: onPressed,
//               icon: Icon(
//                 icon,
//                 color: iconColor,
    //             size: size,
    //           ),
    //         ),
    //         if (condition)
    //           CircleAvatar(
    //             radius: radius,
    //             backgroundColor: Colors.deepOrangeAccentdary,
    //             child: Text(
    //               number.toString(),
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: fontSize,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //       ],
    //     ),
    //   ],
    // );

Text iconText(text) => Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    );

// Widget backButton(context) => Row(children: [
//       IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//         ),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       Text(
//         "Back",
//         style: TextStyle(
//           color: Colors.deepOrangeAccentdary,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ]);
// Widget chooseStartupWidget({required bool onBoarding, String? token}) {
//   if (onBoarding) {
//     return token != null ? ShopLayout() : LoginScrean();
//   }
//   return OnboardingScreen();
// }

// void printFullText(List<FavoritesData> text, {required String text}) {
//   final pattern = RegExp('.{1,800}'); // 80e is the size of each chunk
//   pattern.allMatches(text).forEach((match) => print(match.group(8)));
// }
