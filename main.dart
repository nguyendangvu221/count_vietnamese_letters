import 'dart:io';

void countAndPrintVietnameseChars(String str) {
  final vietnameseChars = {
    'aa': 'aa',
    'aw': 'aw',
    'dd': 'dd',
    'ee': 'ee',
    'oo': 'oo',
    'ow': 'ow',
    'w': 'w',
  };

  int count = 0;
  List<String> foundChars = [];
  for (int i = 0; i < str.length; i++) {
    String currentChar = str[i];
    if (i < str.length - 1) {
      String charPair = str.substring(i, i + 2);
      if (vietnameseChars.containsKey(charPair)) {
        count++;
        foundChars.add(vietnameseChars[charPair]!);
        i++;
      }
    }
    if (vietnameseChars.containsKey(currentChar)) {
      count++;
      foundChars.add(vietnameseChars[currentChar] ?? '');
    }
  }

  stdout.write(count);
  stdout.write(' (');
  if (count > 0) {
    for (int i = 0; i < foundChars.length; i++) {
      stdout.write(foundChars[i]);
      if (i < foundChars.length - 1) {
        stdout.write(', ');
      }
    }
  }
  stdout.write(')');
}

void main() {
  String input = stdin.readLineSync() ?? '';
  countAndPrintVietnameseChars(input);
}
