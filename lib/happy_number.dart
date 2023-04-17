// ignore_for_file: avoid_print

void main() {
  happyNumber();
}

void happyNumber() {
  int number = 20;
  int happyNumber = 0;
  int reminder = 0;
  int updatedNumber = 0;
  int input = number;
  while (number != 0) {
// --------------------------------------------------------------------
    reminder = number % 10; // get the reminder
    updatedNumber = number - reminder;
    number = updatedNumber ~/ 10;
// --------------------------------------------------------------------
    happyNumber = happyNumber + (reminder * reminder);
    if (number == 0) {
      if (happyNumber.toString().length == 1) {
        if (happyNumber == 1) {
          print("$input is a happy number");
          break;
        }
        print("$input is not a happy number");
        break;
      }
      number = happyNumber;
      happyNumber = 0;
    }
  }
}
