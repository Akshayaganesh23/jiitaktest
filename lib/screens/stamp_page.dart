import 'package:flutter/material.dart';

class StampPage extends StatelessWidget {
  const StampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(163, 172, 251, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(163, 172, 251, 1),
          elevation: 0,
          leading: _leadingIcon(context),
          title: const Center(
            child: Text(
              "スタンプカード詳細",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          actions: const [
            Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: 20)
          ],
        ),
        body: Column(
          children: [
            _header(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _starGridView(context),
                        itemCount: 3,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                          alignment: Alignment.topRight, child: Text("3/3 個")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("スタンプ獲得履歴",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: _stampHistoryListView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _leadingIcon(context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(148, 158, 255, 1),
            borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  ListView _stampHistoryListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("2021 / 11 / 18",
                        style: TextStyle(
                            color: Color.fromRGBO(181, 181, 181, 1),
                            fontSize: 18)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("スタンプを獲得しました。", style: TextStyle(fontSize: 18)),
                      Text("1 個", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ));
  }

  Container _starGridView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                spreadRadius: 4)
          ]),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) => Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/star.png"),
            const Icon(
              Icons.check_rounded,
              color: Colors.white,
            )
          ],
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      height: 70,
      color: const Color.fromRGBO(163, 172, 251, 1),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Mer キッチン",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            RichText(
              text: const TextSpan(
                  children: [
                    TextSpan(text: "現在の獲得数", style: TextStyle(fontSize: 16)),
                    TextSpan(
                        text: "30",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    TextSpan(text: "個", style: TextStyle(fontSize: 16))
                  ],
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
