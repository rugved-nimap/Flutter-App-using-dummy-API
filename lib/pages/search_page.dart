import 'package:dummy_api/controller/app_controller.dart';
import 'package:dummy_api/pages/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Search Page',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            backgroundColor: Colors.indigo.shade700,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.editingController,
                  onSubmitted: (value) {
                    controller.fetchDataFromSearch(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Search here"),
                ),
              ),
              controller.searchData["products"] != null
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: controller.searchData["products"].length,
                        itemBuilder: (context, index) {
                          return ItemsTiles(
                            index: index,
                            controller: controller,
                            data: controller.searchData,
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ))
            ],
          ),
        );
      },
    );
  }
}
