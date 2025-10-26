import 'dart:math';

String generateRandomNumber() {
  final random = Random();
  String number = '';
  for (int i = 0; i < 14; i++) {
    number += random.nextInt(10).toString();
  }
  return number;
}
