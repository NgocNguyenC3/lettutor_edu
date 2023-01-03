import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/pdf_view/pdf_controller.dart';

class PdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PdfController());
  }
}
