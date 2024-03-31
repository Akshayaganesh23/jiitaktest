import 'package:get/get.dart';

class EditStoreController extends GetxController {
  final selectedOption = '1'.obs;
  final selectedCheckboxItem = '1'.obs;
  final isChecked1 = true.obs;
  final isChecked2 = false.obs;
  final isChecked3 = true.obs;
  final isChecked4 = false.obs;
  final isChecked5 = true.obs;
  final isChecked6 = false.obs;
  final selectedDropDownItem1 = '10:00'.obs;
  final selectedDropDownItem2 = '20:00'.obs;
  final selectedDropDownItem3 = '11:00'.obs;
  final selectedDropDownItem4 = '15:00'.obs;

  void onOptionChanged(String? option) {
    if (option != null) {
      selectedOption.value = option;
    }
  }

  void onCheckBoxItemChanged(String? item) {
    if (item != null) {
      selectedCheckboxItem.value = item;
    }
  }

  void onCheckBox1ValueChanged() {
    isChecked1.value = !isChecked1.value;
  }

  void onCheckBox2ValueChanged() {
    isChecked2.value = !isChecked2.value;
  }

  void onCheckBox3ValueChanged() {
    isChecked3.value = !isChecked3.value;
  }

  void onCheckBox4ValueChanged() {
    isChecked4.value = !isChecked4.value;
  }

  void onCheckBox5ValueChanged() {
    isChecked5.value = !isChecked5.value;
  }

  void onCheckBox6ValueChanged() {
    isChecked6.value = !isChecked6.value;
  }

  void onDropDownItemChanged1(String? value) {
    if (value != null) {
      selectedDropDownItem1.value = value;
    }
  }

  void onDropDownItemChanged2(String? value) {
    if (value != null) {
      selectedDropDownItem2.value = value;
    }
  }

  void onDropDownItemChanged3(String? value) {
    if (value != null) {
      selectedDropDownItem3.value = value;
    }
  }

  void onDropDownItemChanged4(String? value) {
    if (value != null) {
      selectedDropDownItem4.value = value;
    }
  }
}
