import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:karrishni/representation/main/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView(
              children: [
                Obx(
                  () => SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.categoriesDocs?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Text(
                            controller.categoriesDocs?[index].data().name ??
                                '');
                      },
                    ),
                  ),
                ),
                SizedBox(height: 300),
                Obx(() => Column(
                      children: controller.restaurantsDocs
                              ?.map((query) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      child: Text(query.data().name),
                                      onPressed: () => controller
                                          .onRestaurantClicked(query.data().id),
                                    ),
                                  ))
                              .toList() ??
                          [],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
