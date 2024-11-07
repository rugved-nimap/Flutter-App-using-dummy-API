import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/app_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Detail Page',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            backgroundColor: Colors.indigo.shade700,
          ),
          body: SingleChildScrollView(
            child: controller.itemData.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                          itemCount: controller.itemData["images"].length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              controller.itemData["images"][index],
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return Center(
                                      child: child); // Image loaded, display it
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  ); // Display a loading indicator
                                }
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                    child: Icon(Icons.error)); // Error handling
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.itemData["title"].toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          controller.itemData["brand"].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.itemData["rating"].toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(controller.itemData["description"].toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text:
                                        "- ${controller.itemData["discountPercentage"]}%  ",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightGreen)),
                                TextSpan(
                                    text:
                                        "\u{0024} ${controller.itemData["price"]}"),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8),
                        child: Text(
                          "${controller.itemData["availabilityStatus"]}",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.lightGreen),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${controller.itemData["stock"]} items are left !!",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.redAccent),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Text(
                          "Ratings",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: PageView.builder(
                          itemCount: controller.itemData["reviews"].length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.itemData["reviews"][index]
                                                  ["reviewerName"]
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          controller.itemData["reviews"][index]
                                                  ["comment"]
                                              .toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 35,
                                      ),
                                      Text(
                                        controller.itemData["reviews"][index]
                                                ["rating"]
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
