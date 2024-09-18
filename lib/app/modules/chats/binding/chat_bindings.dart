

import '../../../export.dart';
import '../controller/chat_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatScreenController>(
          () => ChatScreenController(),
    );

  }
}
