import 'dart:io';
/*
Cách làm này sử dụng một mảng vietnameseChars chứa tất cả các cặp ký tự Tiếng Việt có thể xuất hiện trong chuỗi. Sau đó, trong vòng lặp, chúng ta kiểm tra từng ký tự trong chuỗi đầu vào.
Nếu ký tự hiện tại kết hợp với ký tự tiếp theo tạo thành một cặp ký tự Tiếng Việt, ta tăng biến đếm count, thêm cặp ký tự đó vào danh sách foundChars, và bỏ qua ký tự tiếp theo vì đã tạo thành cặp.
Nếu ký tự hiện tại không tạo thành cặp với ký tự tiếp theo, ta kiểm tra xem ký tự đó có phải là một ký tự Tiếng Việt không. Nếu có, ta cũng tăng biến đếm count và thêm ký tự đó vào danh sách foundChars.
Cuối cùng, sau khi kiểm tra hết chuỗi đầu vào, chúng ta in ra số lượng và danh sách các ký tự Tiếng Việt tìm thấy tương ứng. */

void countAndPrintVietnameseChars(String str) {
  final vietnameseChars = [
    'aa',
    'aw',
    'dd',
    'ee',
    'oo',
    'ow',
    'w',
  ];

  int count = 0;
  List<String> foundChars = [];
  for (int i = 0; i < str.length; i++) {
    String currentChar = str[i];
    if (i < str.length - 1) {
      String charPair = str.substring(i, i + 2);
      if (vietnameseChars.contains(charPair)) {
        count++;
        foundChars.add(charPair);
        i++;
      }
    }
    if (vietnameseChars.contains(currentChar)) {
      count++;
      foundChars.add(currentChar);
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
