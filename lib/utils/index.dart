class Utils {
  static num calculateTwoNumbers(
      {required num number1, required num number2, required String operator}) {
    switch (operator.trim()) {
      case "+":
        return number1 + number2;

      case "-":
        return number1 - number2;

      case "/":
        return number1 / number2;

      case "x":
        return number1 * number2;

      case "%":
        return number1 % number2;

      default:
        return 0;
    }
  }
}
