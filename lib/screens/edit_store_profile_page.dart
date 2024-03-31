import 'package:flutter/material.dart';

class EditStoreProfilePage extends StatelessWidget {
  const EditStoreProfilePage({super.key});

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
      body: SingleChildScrollView(
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
            _selectedImage("店舗外観*（最大3枚まで）", "assets/images/entrance_image.png"),
            _selectedImage(
                "店舗内観*（1枚〜3枚ずつ追加してください）", "assets/images/office_image.png"),
            _selectedImage(
                "料理写真*（1枚〜3枚ずつ追加してください）", "assets/images/food_image.png"),
            _selectedImage(
                "メニュー写真*（1枚〜3枚ずつ追加してください）", "assets/images/books_image.png"),
          ],
        ),
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

  Icon _notificationIcon() {
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
