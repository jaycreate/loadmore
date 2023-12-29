import 'package:flutter/material.dart';
import 'package:flutter_list2/controller/controller.dart';
import 'package:flutter_list2/widget/widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load more"),
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            onScroll(controller);
            return ListView.builder(
                controller: _scrollController,
                itemCount: controller.listData.length,
                itemBuilder: (context, index) {
                  var fullName =
                      "${controller.listData[index].no}. ${controller.listData[index].fullName}";
                  return AppListTile(
                    leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/no-image.png')),
                    title: fullName,
                    subtitle: controller.listData[index].address,
                    border: (controller.listData.length - 1) == index
                        ? false
                        : true,
                  );
                });
          }),
    );
  }

  onScroll(controller) {
    _scrollController.addListener(() async {
      var position = _scrollController.position.pixels;
      if (position >= _scrollController.position.maxScrollExtent - 150) {
        // The preventCall to avoid call API many times.
        if (!controller.preventCall) {
          controller.fetchData().then((_) => controller.preventCall = false);
          controller.preventCall = true;
        }
      }
    });
  }
}
