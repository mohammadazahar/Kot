import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedOption = 0.obs;

  void selectOption(int option) {
    selectedOption.value = option;
  }
}
