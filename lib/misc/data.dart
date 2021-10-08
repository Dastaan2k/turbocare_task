import 'package:flutter/cupertino.dart';

class Data {

  static String willPopScopeKey = '_';

  static GlobalKey navigatorKey = GlobalKey();

  static List<String> fuelTypeList = [
    'Petrol', 'Diesel', 'CNG', 'Petrol + CNG', 'Electric', 'Hybrid'
  ];

  static List<String> transmissionList = ['Manual', 'Automatic'];

  static String savedVNumber = '';

}