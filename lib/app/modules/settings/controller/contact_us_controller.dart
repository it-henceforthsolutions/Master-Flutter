import 'package:country_calling_code_picker/country.dart';
import 'package:engagely/app/core/base/base_controller.dart';
import 'package:engagely/app/modules/live/controller/stream_music/stream_music_controller.dart';
import 'package:engagely/app/modules/profile/views/otp_verification_screen.dart';

import '../../../export.dart';

class ContactUsController extends BaseController {
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  TextEditingController firstNameTextController = TextEditingController(text: "");
  TextEditingController mobileTextController = TextEditingController(text: "");
  TextEditingController emailEditTextController = TextEditingController(text: "");
  TextEditingController dobEditTextController = TextEditingController(text: "");
  TextEditingController descrptionEditTextController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode descrptionFocusNode = FocusNode();
  RxBool isVerified= false.obs;

  final APIRepository _repository = Get.find<APIRepository>();
  final LocalStorage _LocalStorage = Get.find<LocalStorage>();
  Rx<Country> selectedCountry =
      const Country("United Arab Emirates", "flags/khm.png", "UAE", "+971").obs;
  LoginDataModel loginResponseModel = LoginDataModel();
  Rx<LoginDataModel> loginDataModel = LoginDataModel().obs;

  RxList<UserName> userList = [
  UserName( image: iconsProfile),
  UserName( image: icAddUserGrey),

  ].obs;

  @override
  void onInit() {

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

  void showOtpVerificationSheet() async{
    var data = await Get.dialog(const VerificationView());
    debugPrint("dataRecived on Verification $data");
    if(data!=null){
      isVerified.value= data;
      isVerified.refresh();
    }
  }



}
