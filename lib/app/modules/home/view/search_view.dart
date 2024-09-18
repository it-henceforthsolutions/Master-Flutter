/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */


import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/home/controller/search_view_controller.dart';
import 'package:engagely/app/modules/home/widget/user_item_view.dart';


class SearchView extends BaseView<SearchViewController> {
  SearchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        _searchEditText(),
        _listView(),
      ],
    );
  }

  _searchEditText() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, -1.0),
                blurRadius: 3.0 //(x,y)
                ),
          ],
        ),
        padding: EdgeInsets.only(bottom: margin_15,top: margin_15),
        child: TextFieldWidget(textController: controller.textEditingController,
          hint: strSearch,
          contentPadding: EdgeInsets.symmetric(
            vertical: margin_15,
          ),
          inputType: TextInputType.name,
          fillColor: Colors.grey.shade200,
          onChange: (data){
          if(data.length==0){
            controller.isDataShow.value=false;
          }else{
            controller.isDataShow.value=true;
          }
          },
          prefixIcon: ButtonWidget(onTap: (){
            Get.back();
          },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: margin_20,
            ).marginOnly(left: margin_20,right: margin_10),
          ),
          inputAction: TextInputAction.next,
          decoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
        ).marginSymmetric(horizontal: margin_8),
      );


  Widget _listView()=>Obx(()=>controller.isDataShow.value==false?emptySizeBox():
     Expanded(
      child: ListView.builder(itemCount: 8,itemBuilder: (context,index){
      return UserItemView(index: index,).paddingSymmetric(vertical: margin_10);
      }).paddingSymmetric(horizontal: margin_15),
    ),
  );
}
