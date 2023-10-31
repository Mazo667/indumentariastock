import 'package:intl/intl.dart';

class PricesFormat{
  static String number(double number, [int decimals = 0]){
    final formattedNumber = NumberFormat.simpleCurrency(
      decimalDigits: decimals,
      locale: 'en'
    ).format(number);
    return formattedNumber;
  }
}