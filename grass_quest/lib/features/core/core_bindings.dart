
import 'package:get/instance_manager.dart';
import 'package:grass_quest/features/core/core_controller';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CoreController>(CoreController());
  }
}
