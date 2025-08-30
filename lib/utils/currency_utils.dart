import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CurrencyInfo {
  final String label;
  final String symbol;
  final String locale;
  CurrencyInfo(this.label, this.symbol, this.locale);
}

final Map<String, CurrencyInfo> expenseCurrency = {
  'Pagi': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
  'Siang': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
  'Sore': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
  'Malam': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
  'Bensin': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
};

final Map<String, CurrencyInfo> incomeCurrency = {
  'Gaji': CurrencyInfo('IDR', 'Rp. ', 'id_ID'),
  'Trade': CurrencyInfo('USD', '\$', 'en_US'),
};

String formatCurrency(num value, CurrencyInfo info) {
  if (info.label == 'IDR') {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return format.format(value);
  }
  if (info.label == 'USD') {
    final format = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 2);
    return format.format(value / 100);
  }
  final format = NumberFormat.currency(locale: info.locale, symbol: info.symbol);
  return format.format(value);
}

class CurrencyInputFormatter extends TextInputFormatter {
  final CurrencyInfo info;
  CurrencyInputFormatter(this.info);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) digits = '0';
    num value = num.tryParse(digits) ?? 0;
    String formatted = formatCurrency(value, info);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// Untuk penambahan mata uang lain, cukup tambahkan di sini dan update mapping

final CurrencyInfo defaultCurrencyInfo = CurrencyInfo('IDR', 'Rp. ', 'id_ID');
