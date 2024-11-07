import 'package:dummy_api/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class ItemsTiles extends StatelessWidget {
  final AppController controller;
  final int index;
  final Map<String, dynamic> data;

  const ItemsTiles(
      {super.key,
      required this.index,
      required this.controller,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.fetchParticularItemData(data["products"][index]["id"]);
        Get.to(() => const DetailPage());
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Center(
                  child: Image.network(
                      data["products"][index]["thumbnail"].toString(),
                    fit: BoxFit.contain,
                  ),
                )),
            Text(data["products"][index]["title"].toString()),
            Text(
              "\u{0024} ${data["products"][index]["price"].toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
