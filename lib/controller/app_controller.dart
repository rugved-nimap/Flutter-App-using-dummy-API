
import 'package:dummy_api/repositary/data_fetch_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Map<String, dynamic> homeScreenData = {};
  Map<String, dynamic> itemData = {};
  Map<String, dynamic> searchData = {};

  final ScrollController scrollController = ScrollController();
  final TextEditingController editingController = TextEditingController();

  final DataFetchRepo _repo = DataFetchRepo();

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  @override
  void onReady() {
    scrollController.addListener(scrollToAddMore);
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollToAddMore);
    scrollController.dispose();
    editingController.dispose();
    super.onClose();
  }

  void scrollToAddMore() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      fetchAllData();
    }
  }

  void fetchAllData() async {
    if (homeScreenData.isNotEmpty) {
      Map<String, dynamic> newData = await _repo.fetchData("products?skip=${homeScreenData["products"].length}");

      homeScreenData["products"].addAll(newData["products"]);
    } else {
      homeScreenData = await _repo.fetchData("products?skip=0");
    }
    update();
  }

  void fetchParticularItemData(int id) async {
    itemData.clear();

    itemData = await _repo.fetchData("products/$id");
    update();
  }

  void fetchDataFromSearch(String query) async {
    searchData.clear();

    searchData = await _repo.fetchData("products/search?q=$query");
    update();
  }
}
