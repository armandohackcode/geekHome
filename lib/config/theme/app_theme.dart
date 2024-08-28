import 'package:appgeekhome/config/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  OutlineInputBorder borderInput({Color color = AppStyles.fontColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }

  ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor: AppStyles.backgroundColor,
        textTheme: Typography.blackRedmond.apply(
          bodyColor: AppStyles.fontColor,
          fontFamily: 'Quicksand',
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(9),
          fillColor: const Color.fromARGB(255, 33, 33, 33),
          filled: true,
          enabledBorder: borderInput(),
          focusedErrorBorder: borderInput(),
          focusedBorder: borderInput(),
          errorBorder: borderInput(color: Colors.red),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(9),
            fillColor: const Color.fromARGB(255, 77, 77, 77),
            filled: true,
            enabledBorder: borderInput(),
            focusedErrorBorder: borderInput(),
            focusedBorder: borderInput(),
            errorBorder: borderInput(color: Colors.red),
          ),
        ),
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          color: AppStyles.backgroundColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: AppStyles.fontColor,
          titleTextStyle: TextStyle(
            color: AppStyles.fontColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.green,
        primaryColor: AppStyles.primaryColor,
      );
}
