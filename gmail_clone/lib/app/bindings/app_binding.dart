import 'package:get/get.dart';
import '../controllers/email_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EmailController(), permanent: true);
  }
}
