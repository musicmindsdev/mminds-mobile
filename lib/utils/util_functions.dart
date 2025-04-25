
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:music_minds/src/models.dart';

class UtilFunctions {
  static Future<CustomButtonState> updateButtonState(
    CustomButtonState state,
  ) async {
    return state;
  }

  /// The function converts a list of integers to a list of strings.
  ///
  /// Args:
  ///   data (List<int>): A list of integers that needs to be converted to a list of strings.
  ///
  /// Returns:
  ///   A new list of strings is being returned, where each element in the original list of integers has
  /// been converted to a string using the `toString()` method.
  static List<String> intListToStringList(List<int> data) {
    return data.map((numbers) => numbers.toString()).toList();
  }

  /// The function converts a list of strings to a list of integers in Dart.
  ///
  /// Args:
  ///   data (List<String>): The parameter `data` is a `List` of `String` objects that contains the data
  /// to be converted to a `List` of `int` objects.
  ///
  /// Returns:
  ///   a list of integers obtained by parsing each element of the input list of strings using the
  /// `int.parse` method.
  static List<int> stringListToIntList(List<String> data) {
    return data.map(int.parse).toList();
  }

  static String removeSpaces(String input) {
    return input.replaceAll(' ', '');
  }

  static bool isDouble(double percent) {
    if (percent.compareTo(percent.toInt()) != 0) {
      // If the percent value is a decimal char
      return true;
    } else {
      // If the percent value is oan Integer
      return false;
    }
  }

  /// The function `formatDate` takes a string representation of a date and an optional pattern, and
  /// returns the formatted date according to the specified pattern and date pattern can be modified.
  /// Returns:
  ///   The formatted date string is being returned.
  static String formatDate(String? date, {String pattern = 'MM/dd/yyyy'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedDate = DateFormat(pattern).format(stringDateToDatetime);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (var i = 1; i < value.length; i++) {
      if (value[i - 1] == ' ') {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  static String formatAmount(double amount) {
    if (amount >= 1000000) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0.00').format(amount);
    }
  }

  static String formatNumber(int amount) {
    if (amount >= 1000000) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0').format(amount);
    }
  }

  static Future<XFile?> pickImage() async {
    return ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 600,
      maxWidth: 600,
    );
  }
  static Future<XFile?> takePhoto() async {
    return ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 600,
      maxWidth: 600,
    );
  }
}
