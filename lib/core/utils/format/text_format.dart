
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class FormatText {
  static String getTimeLocal({String? time, required BuildContext context}) {
    if (time == null) {
      return DateTime.now().toString();
    } else {
      var tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
      return DateFormat(
        'yyyy-MM-dd kk:mm',
        tag,
      ).format(DateTime.parse(time)).toString();
    }
  }

  static String getCalendar(int? calendar) {
    return DateFormat("dd.MM.yyyy", 'en').format(
        DateTime.fromMillisecondsSinceEpoch(
            (calendar ?? 0000000000000) * 1000));
  }
  static String getTime({int? time}) {
    initializeDateFormatting();
    return DateFormat("dd.MM.yyyy/ HH:mm", 'en').format(
        DateTime.fromMillisecondsSinceEpoch(
            (time ?? 0000000000000) * 1000));
  }

  static String getTimeLocal2({String? time}) {
    if (time == null) {
      return DateTime.now().toString();
    } else {
      return DateFormat(
        'yyyy-MM-dd HH:mm',
      ).format(DateTime.parse(time).toLocal()).toString();
    }
  }

  static String formatPhone(String phone) {
    String prefix = phone.substring(0, 4);
    String areaCode = phone.substring(4, 6);
    String major = phone.substring(6, 9);
    String minor = phone.substring(9, 11);
    String patch = phone.substring(11);
    String formatted = '$prefix ($areaCode) $major-$minor-$patch';
    return formatted;
  }

  String moneyFormat(String price) {
    if (price.length > 1 && price[0] == '0') {
      return isMinus(price)
          ? "-${price.replaceFirst('0', '')}"
          : price.replaceFirst('0', '');
    }
    if (price.length >= 4) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return isMinus(value) ? "-$value" : value;
    } else {
      return isMinus(price) ? "-$price" : price;
    }
  }

  bool isMinus(String text) {
    return text.contains('-');
  }

  String moneyFormat2(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return isMinus(price) ? "-$value" : value;
    } else {
      return isMinus(price) ? "-$price" : price;
    }
  }

  String moneyFormatCU(String price) {
    int index = 0;
    String formatPrice = price;
    if (price == '.') {
      return formatPrice = '0.';
    }
    if (formatPrice.length > 1 &&
        formatPrice[0] == '0' &&
        !formatPrice.contains('0.')) {
      formatPrice = price.replaceFirst('0', '');
    }

    for (int i = 0; i < formatPrice.length; i++) {
      if (price[i] == '.') {
        index++;
      }
    }

    if (index == 2) {
      formatPrice = formatPrice.substring(0, formatPrice.length - 1);
      return isMinus(formatPrice) ? "-$formatPrice" : formatPrice;
    }
    if (formatPrice.contains('.') && formatPrice != '0.') {
      String textNew = formatPrice.substring(0, formatPrice.indexOf('.'));
      String doubleText = formatPrice.replaceAll('$textNew.', '');
      if (doubleText.length > 2) {
        doubleText = doubleText.substring(0, 2);
      }
      formatPrice = '$textNew.$doubleText';
    }

    return isMinus(formatPrice) ? "-$formatPrice" : formatPrice;
  }

  String replaceNumberRound(String number, {bool? isPlus = false}) {
    String numberTemp = moneyFormatCU(
      number.replaceAll(' ', '').replaceAll('-', ''),
    ).replaceAll('.00', '');
    if (numberTemp.contains('.')) {
      String temp = number;
      int index = temp.indexOf('.');
      temp = temp.substring(index, temp.length).replaceAll('.', '');
      if (temp.length == 1) {
        numberTemp = numberTemp.replaceAll('.0', '');
      }
    }
    return isMinus(number)
        ? "-$numberTemp"
        : "${isPlus! ? '+' : ''}$numberTemp";
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter =
    NumberFormat.simpleCurrency(locale: "uz", decimalDigits: 0);

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
