import 'package:intl/intl.dart';

class FunctionsUtils {
  FunctionsUtils._();

  static FunctionsUtils? _functionsUtils;

  static FunctionsUtils getInstance() {
    _functionsUtils ??= FunctionsUtils._();
    return _functionsUtils!;
  }

  String? formatTextDate(String dateTimeString) {
    DateTime? dateTime = DateTime.tryParse(dateTimeString);
    return DateFormat('dd/mm/yyyy HH:mm:ss').format(dateTime!);
  }
}
