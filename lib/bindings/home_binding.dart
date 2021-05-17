import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:karrishni/data/data_sources/home/home_data_source_impl.dart';
import 'package:karrishni/data/repos/home/home_repo_impl.dart';
import 'package:karrishni/domain/data_sources/home/home_data_source.dart';
import 'package:karrishni/domain/repos/home/home_repo.dart';
import 'package:karrishni/domain/usecases/home/watch_categories.dart';
import 'package:karrishni/domain/usecases/home/watch_meals_for.dart';
import 'package:karrishni/domain/usecases/home/watch_restaurants.dart';
import 'package:karrishni/representation/main/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDataSource>(() => HomeDataSourceImpl(store: Get.find()));
    Get.lazyPut<HomeRepo>(() => HomeRepoImpl(homeDataSource: Get.find()));
    Get.lazyPut(() => WatchCategories(homeRepo: Get.find()));
    Get.lazyPut(() => WatchRestaurants(homeRepo: Get.find()));
    Get.lazyPut(() => WatchMealsFor(homeRepo: Get.find()));
    Get.put(HomeController(
      watchCategories: Get.find(),
      watchRestaurants: Get.find(),
      watchMealsFor: Get.find(),
    ));
  }
}
