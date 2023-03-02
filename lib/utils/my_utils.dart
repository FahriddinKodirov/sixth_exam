import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;


List cardPhoto = [
  'assets/images/card_photo11.png',
  'assets/images/card_photo33.png',
  'assets/images/card_photo13.png',
];

List cardColor = [
  Colors.amber,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.black54,
  Colors.teal,
  Colors.yellow,
  Colors.black,
  Colors.red,
  Colors.teal,
  Colors.white30,
  Colors.yellow,
  Colors.teal,
  Colors.green
];


InputDecoration getInputDecoration({required String label,light}) {
  
  return InputDecoration(
    filled: true,
    fillColor:  Colors.black26,
    hintText: label,
    hintStyle: TextStyle(color: light?Colors.white30:Colors.black),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),borderRadius: BorderRadius.circular(20)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Colors.black),borderRadius: BorderRadius.circular(20)),
    
  );
}

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
}



class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}

List cardName = [
 'humo',
 'payme',
 'viso',
];