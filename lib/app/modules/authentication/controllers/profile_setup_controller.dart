


/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/base/base_controller.dart';

import '../../../export.dart';


class ProfileSetupController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController emailEditTextController = TextEditingController();
  TextEditingController dobEditTextController = TextEditingController();
  TextEditingController descrptionEditTextController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode descrptionFocusNode = FocusNode();

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _LocalStorage = Get.find<LocalStorage>();

  LoginDataModel loginResponseModel = LoginDataModel();
  Rx<LoginDataModel> loginDataModel = LoginDataModel().obs;

  bool isEdit = false;

  @override
  void onInit() {
    if(Get.arguments != null) {
      isEdit = Get.arguments[argIsEdit];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxString profileImage = "".obs;

  updateImageFile(Future<PickedFile?> imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      profileImage.value = file.path;
    }
  }


  profileSetupApiCall() async{

    Map<String,dynamic> requestBody = AuthRequestModel.profileCompletionApiCall();
    Get.toNamed(AppRoutes.addAddressView);

}




}