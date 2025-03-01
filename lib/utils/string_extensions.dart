extension NumberFormatting on int {
  String toCommaSeparated() {
    final numberStr = toString();
    final buffer = StringBuffer();
    int count = 0;

    for (int i = numberStr.length - 1; i >= 0; i--) {
      buffer.write(numberStr[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    return buffer.toString().split('').reversed.join('');
  }
}
