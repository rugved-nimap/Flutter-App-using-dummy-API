import 'package:dummy_api/controller/app_controller.dart';
import 'package:dummy_api/pages/items_widget.dart';
import 'package:dummy_api/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home Page',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            backgroundColor: Colors.indigo.shade700,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const SearchPage());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
          body: controller.homeScreenData["products"] != null
              ? GridView.builder(
                  controller: controller.scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.homeScreenData["products"].length,
                  itemBuilder: (context, index) {
                    return ItemsTiles(
                      index: index,
                      controller: controller,
                      data: controller.homeScreenData,
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                ),
        );
      },
    );
  }
}
