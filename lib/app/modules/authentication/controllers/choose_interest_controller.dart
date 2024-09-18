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
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/authentication/models/request_model/interest_model.dart';


class ChooseYourInterestController extends BaseController {
  RxList<InterestModel> interestList = RxList.empty();
   RxInt selectedIndex=0.obs;
 
  @override
  void onInit() {
    initList();
    super.onInit();
  }
  
  initList(){
    interestList.clear();
    interestList.add(InterestModel(title: "Music",image: image1));
    interestList.add(InterestModel(title: "Book lover",image: image2));
    interestList.add(InterestModel(title: "Sport fan",image: image3));
    interestList.add(InterestModel(title: "Travel",image: image6));
    interestList.add(InterestModel(title: "Art lover",image: image7));
    interestList.add(InterestModel(title: "Movie",image: image8));
    interestList.add(InterestModel(title: "Shopping",image: image9));
    interestList.add(InterestModel(title: "Writer",image: image10));
    interestList.add(InterestModel(title: "Go fishing",image: image11));
  }
}
