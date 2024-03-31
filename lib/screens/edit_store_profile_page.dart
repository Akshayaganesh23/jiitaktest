import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitaktest/controllers/edit_store_controller.dart';

class EditStoreProfilePage extends StatelessWidget {
  EditStoreProfilePage({super.key});

  final editStoreController = Get.put(EditStoreController());
  final _dropDownItems = ['1', '料理カテゴリー選択', '3', '4'];
  final _dropDownTimeItems = [
    '12:00',
    '1:00',
    '2:00',
    '3:00',
    '4:00',
    '5:00',
    '6:00',
    '7:00',
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00'
  ];

  final _checkBoxItem = ['月', '火', '水', '木', '金', '土', '日', '祝'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: _header(context),
        title: const Center(
          child: Text(
            "店舗プロフィール編集",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        actions: [_notificationIcon(), const SizedBox(width: 20)],
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textField("店舗名*", "Mer キッチン"),
              const SizedBox(height: 10),
              _textField("代表担当者名*", "林田　絵梨花"),
              const SizedBox(height: 10),
              _textField("店舗電話番号*", "123 - 4567 8910"),
              const SizedBox(height: 10),
              _textField("店舗住所*", "大分県豊後高田市払田791-13"),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/map_image.png",
                    fit: BoxFit.fill,
                  )),
              _selectedImage(
                  "店舗外観*（最大3枚まで）", "assets/images/entrance_image.png"),
              _selectedImage(
                  "店舗内観*（1枚〜3枚ずつ追加してください）", "assets/images/office_image.png"),
              _selectedImage(
                  "料理写真*（1枚〜3枚ずつ追加してください）", "assets/images/food_image.png"),
              _selectedImage(
                  "メニュー写真*（1枚〜3枚ずつ追加してください）", "assets/images/books_image.png"),
              _sizedHeight(),
              _heading("営業時間*"),
              _sizedHeight(),
              _inLineDropDownTime1(context),
              _sizedHeight(),
              _heading("ランチ時間*"),
              _sizedHeight(),
              _inLineDropDownTime2(context),
              _sizedHeight(),
              _heading("定休日*"),
              _checkBoxGridView(),
              _sizedHeight(),
              _heading("料理カテゴリー*"),
              _sizedHeight(),
              _dropdownList(context),
              _sizedHeight(),
              _heading("料理カテゴリー*"),
              _sizedHeight(),
              _inLineSmallTextField(context),
              _sizedHeight(),
              _textField("キャッチコピー*", "美味しい！リーズナブルライスランチ！"),
              _sizedHeight(),
              _textField("座席数*", "40席"),
              _sizedHeight(),
              _heading("喫煙席*"),
              _inLineCheckBox1(),
              _heading("駐車場*"),
              _inLineCheckBox2(),
              _heading("来店プレゼント*"),
              _inLineCheckBox3(),
              Image.asset("assets/images/soft_drinks_image.png"),
              _textField("来店プレゼント名*", "いちごクリームスクリーム, ジュース"),
              const SizedBox(
                height: 10,
              ),
              _disabledButton(context),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _disabledButton(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(4)))),
                backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 203, 135))),
            child: const Text(
              "編集を保存",
              style: TextStyle(color: Colors.white),
            )));
  }

  Row _inLineSmallTextField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _widthSmallTextField("¥ 1,000", context),
        const Text(
          "~",
          style: TextStyle(fontSize: 26),
        ),
        _widthSmallTextField("¥ 2,000", context),
      ],
    );
  }

  Row _inLineCheckBox1() {
    return Row(
      children: [
        _checkBox(
            label: "有",
            onChange: (value) {
              editStoreController.onCheckBox1ValueChanged();
            },
            value: editStoreController.isChecked1.value),
        const SizedBox(
          width: 5,
        ),
        _checkBox(
            label: "無",
            onChange: (value) {
              editStoreController.onCheckBox2ValueChanged();
            },
            value: editStoreController.isChecked2.value),
      ],
    );
  }

  Row _inLineCheckBox2() {
    return Row(
      children: [
        _checkBox(
            label: "有",
            onChange: (value) {
              editStoreController.onCheckBox3ValueChanged();
            },
            value: editStoreController.isChecked3.value),
        const SizedBox(
          width: 5,
        ),
        _checkBox(
            label: "無",
            onChange: (value) {
              editStoreController.onCheckBox4ValueChanged();
            },
            value: editStoreController.isChecked4.value),
      ],
    );
  }

  Row _inLineCheckBox3() {
    return Row(
      children: [
        _checkBox(
            label: "有（最大３枚まで）",
            onChange: (value) {
              editStoreController.onCheckBox5ValueChanged();
            },
            value: editStoreController.isChecked5.value),
        const SizedBox(
          width: 5,
        ),
        _checkBox(
            label: "無",
            onChange: (value) {
              editStoreController.onCheckBox6ValueChanged();
            },
            value: editStoreController.isChecked6.value),
      ],
    );
  }

  TextField _widthSmallTextField(String hintText, BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromRGBO(232, 232, 232, 1)),
      borderRadius: BorderRadius.circular(5),
    );
    return TextField(
      decoration: InputDecoration(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
          isDense: true,
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(8),
          hintText: hintText,
          fillColor: Colors.grey,
          focusedBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          border: border),
    );
  }

  GridView _checkBoxGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 2),
      itemCount: _checkBoxItem.length,
      itemBuilder: (context, index) {
        return _checkBox(
          label: _checkBoxItem[index],
          value: editStoreController.selectedCheckboxItem.value ==
              _checkBoxItem[index],
          onChange: (item) {
            editStoreController.onCheckBoxItemChanged(_checkBoxItem[index]);
          },
        );
      },
    );
  }

  SizedBox _sizedHeight() {
    return const SizedBox(
      height: 5,
    );
  }

  Text _heading(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }

  Row _inLineDropDownTime1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dropdownTimeList1(context),
        const Text(
          "~",
          style: TextStyle(fontSize: 26),
        ),
        _dropdownTimeList2(context),
      ],
    );
  }

  Row _inLineDropDownTime2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dropdownTimeList3(context),
        const Text(
          "~",
          style: TextStyle(fontSize: 26),
        ),
        _dropdownTimeList4(context),
      ],
    );
  }

  Widget _dropdownTimeList1(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(232, 232, 232, 1),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            padding: const EdgeInsets.all(8),
            items: _dropDownTimeItems
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: editStoreController.selectedDropDownItem1.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 171, 169, 169),
            ),
            onChanged: (value) {
              editStoreController.onDropDownItemChanged1(value);
            }),
      ),
    );
  }

  Widget _dropdownTimeList2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(232, 232, 232, 1),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            padding: const EdgeInsets.all(8),
            items: _dropDownTimeItems
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: editStoreController.selectedDropDownItem2.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 171, 169, 169),
            ),
            onChanged: (value) {
              editStoreController.onDropDownItemChanged2(value);
            }),
      ),
    );
  }

  Widget _dropdownTimeList3(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(232, 232, 232, 1),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            padding: const EdgeInsets.all(8),
            items: _dropDownTimeItems
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: editStoreController.selectedDropDownItem3.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 171, 169, 169),
            ),
            onChanged: (value) {
              editStoreController.onDropDownItemChanged3(value);
            }),
      ),
    );
  }

  Widget _dropdownTimeList4(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(232, 232, 232, 1),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            padding: const EdgeInsets.all(8),
            items: _dropDownTimeItems
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: editStoreController.selectedDropDownItem4.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 171, 169, 169),
            ),
            onChanged: (value) {
              editStoreController.onDropDownItemChanged4(value);
            }),
      ),
    );
  }

  Widget _checkBox(
      {required String label,
      required bool value,
      required void Function(bool?)? onChange}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChange,
          activeColor: const Color.fromRGBO(238, 125, 66, 1),
        ),
        Text(label),
      ],
    );
  }

  Widget _dropdownList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(232, 232, 232, 1),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isDense: true,
            padding: const EdgeInsets.all(8),
            items: _dropDownItems
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: editStoreController.selectedOption.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 171, 169, 169),
            ),
            onChanged: (value) {
              editStoreController.onOptionChanged(value);
            }),
      ),
    );
  }

  Widget _selectedImage(String headerTextField, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTextField,
          style: const TextStyle(fontSize: 18),
        ),
        Image.asset(imagePath),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _textField(String headerTextField, String hintText) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromRGBO(232, 232, 232, 1)),
      borderRadius: BorderRadius.circular(5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTextField,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(8),
              hintText: hintText,
              fillColor: Colors.grey,
              focusedBorder: border,
              enabledBorder: border,
              disabledBorder: border,
              border: border),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _notificationIcon() {
    return const Icon(
      Icons.notification_add_outlined,
      color: Colors.black,
      size: 30,
    );
  }

  Container _header(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.grey,
          size: 18,
        ),
      ),
    );
  }
}
