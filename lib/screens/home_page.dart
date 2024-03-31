import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitaktest/controllers/home_controller.dart';
import 'package:jiitaktest/screens/card_view.dart';
import 'package:jiitaktest/screens/edit_store_profile_page.dart';
import 'package:jiitaktest/screens/stamp_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final dates = List<int>.generate(30, (index) => index + 1);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: _textField(),
        actions: [
          Image.asset("assets/images/Filter_icon.png"),
          const SizedBox(width: 10),
          const Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _headerDate(context),
          const SizedBox(height: 20),
          SizedBox(
            height: 70,
            child: _dateListView(),
          ),
          Expanded(
            child: _cardListView(),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _dateListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dates.length,
      itemBuilder: (context, index) => _dateItem(index),
    );
  }

  Widget _dateItem(int index) {
    return GestureDetector(
      onTap: () => homeController.selectedDate.value = dates[index],
      child: Obx(
        () => Container(
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: homeController.selectedDate.value == dates[index]
                  ? const Color.fromRGBO(250, 170, 20, 1)
                  : Colors.white),
          margin: const EdgeInsets.only(left: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "金",
                style: TextStyle(
                  color: homeController.selectedDate.value == dates[index]
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                dates[index].toString(),
                style: TextStyle(
                  color: homeController.selectedDate.value == dates[index]
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerDate(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 251, 189, 96),
          Color.fromARGB(255, 252, 214, 169)
        ],
      )),
      child: const Center(
        child: Text(
          "2022年 5月 26日（木）",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  ListView _cardListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StampPage()));
          },
          child: const CardViewPage()),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      shape: const CircleBorder(side: BorderSide.none),
      child: const Icon(Icons.location_on_outlined),
    );
  }

  TextField _textField() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: BorderSide.none,
    );
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(6),
        isCollapsed: true,
        isDense: true,
        border: border,
        filled: true,
        fillColor: const Color.fromARGB(255, 247, 245, 245),
        hintText: "北海道, 札幌市",
        disabledBorder: border,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Column(
              children: [Icon(Icons.search), SizedBox(height: 5), Text("さがす")],
            ),
          ),
          const Column(
            children: [
              Icon(Icons.home_repair_service_outlined),
              SizedBox(height: 5),
              Text("お仕事")
            ],
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              Image.asset("assets/images/sms_icon.png"),
              const SizedBox(height: 5),
              const Text("チャット")
            ],
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditStoreProfilePage())),
            child: const Column(
              children: [
                Icon(Icons.person_outline_rounded),
                SizedBox(height: 5),
                Text("マイページ")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
