import 'package:flutter/services.dart';
import 'dart:math';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    // Remove all non-digit characters
    final newText = text.replaceAll(RegExp(r'\D'), '');

    // Format the newText
    String formattedText = '';
    if (newText.isNotEmpty) formattedText += '(';
    if (newText.length >= 2) {
      formattedText += '${newText.substring(0, 2)}) ';
      if (newText.length > 2 && newText.length <= 7) {
        formattedText += newText.substring(2, newText.length);
      } else if (newText.length > 7) {
        formattedText +=
            '${newText.substring(2, 7)}-${newText.substring(7, min(11, newText.length))}';
      }
    } else {
      formattedText += newText;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
