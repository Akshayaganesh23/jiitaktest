import 'package:flutter/material.dart';

class CardViewPage extends StatefulWidget {
  const CardViewPage({super.key});

  @override
  State<CardViewPage> createState() => _CardViewPageState();
}

class _CardViewPageState extends State<CardViewPage> {
  final _image = "assets/images/image1.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                spreadRadius: 4)
          ]),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: _stackContainer(context),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 5),
                _inLineText(),
                const SizedBox(height: 10),
                const Text("5月 31日（水）08 : 00 ~ 17 : 00"),
                const Text("北海道札幌市東雲町3丁目916番地17号"),
                const Text("交通費 300円"),
                _inLineIconWithText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _stackContainer(BuildContext context) {
    return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  _image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 25,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromRGBO(255, 98, 98, 1)),
                child: const Text(
                  "本日まで",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          );
  }

  Row _inLineIconWithText() {
    return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "住宅型有料老人ホームひまわり倶楽部",
                    style: TextStyle(
                      color: Color.fromRGBO(48, 48, 48, 0.35),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Color.fromRGBO(48, 48, 48, 0.35),
                  )
                ],
              );
  }

  Row _inLineText() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color.fromRGBO(238, 171, 64, 0.1),
                    padding: const EdgeInsets.all(5.0),
                    child: const Text(
                      "北海道札幌幌市-町",
                      style: TextStyle(
                          color: Color.fromRGBO(250, 170, 20, 1),
                          fontSize: 12),
                    ),
                  ),
                  const Text(
                    "¥ 6,000",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              );
  }
}
