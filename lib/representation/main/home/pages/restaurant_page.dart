import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:karrishni/representation/main/home/controllers/home_controller.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.to;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Obx(() => Column(
                children: homeController.mealsState.value?.docs
                        .map((doc) => Text(doc.data().toString()))
                        .toList() ??
                    [Text('no data')],
              )),
        ),
      ),
    );
  }
}
