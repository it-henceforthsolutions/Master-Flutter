import 'package:engagely/app/core/base/base_controller.dart';

import '../../../export.dart';

class AllUserController extends BaseController {
  RxInt selectedLinkCategoryIndex = 0.obs;
  RxInt typeStatus = typeOnline.obs;
  RxBool isFollow = false.obs;


}
