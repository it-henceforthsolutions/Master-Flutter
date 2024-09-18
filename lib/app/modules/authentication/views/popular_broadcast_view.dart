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
import 'package:engagely/app/modules/authentication/controllers/popular_broadcast_controller.dart';
import 'package:engagely/app/modules/authentication/widgets/popular_broadcast_iten_view.dart';

class AddPoupularBoradcastView extends BaseView<PopularBroadCastController> {
  AddPoupularBoradcastView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      isCustom: true,
      isbackIcon: true,
      actions: _skipButton(),
    );
  }

  Widget _skipButton() => ButtonWidget(
    onTap: () {
      Get.offAllNamed(AppRoutes.mainViewRoute);
    },
    child: Container(
      margin: EdgeInsets.only(right: margin_10),
      padding:
      EdgeInsets.symmetric(horizontal: margin_18, vertical: margin_8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(margin_15)),
      child: TextView(
          text: strSkip,
          textStyle: textStyleBodyMedium()
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
    ),
  );

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headingTextView(),
        _interestGridView(),
        _startButton(),
      ],
    );
  }

  Widget _headingTextView() => TextView(
    text: strMostPopularBroadcast,
    maxLines: 2,
    textStyle: textStyleHeadlineLarge()
        .copyWith(fontWeight: FontWeight.w700, fontSize: font_22),
  ).marginOnly(top: margin_5,left: margin_18,right: margin_18);

  _interestGridView() => Expanded(
    child: Obx(
          () => GridView.builder(
          itemCount: controller.interestList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .71,
              crossAxisCount: 3,
              mainAxisSpacing: margin_15,
              crossAxisSpacing: margin_15),
          itemBuilder: (context, index) => Obx(()=>
              ButtonWidget(onTap: (){
                controller.interestList[index].isCheck =! controller.interestList[index].isCheck!;
                controller.interestList.refresh();
              },
                child: BroadcastItemView(
                  backgroundColor: controller.selectedIndex.value == index
                      ? AppColors.creamColor
                      : Colors.white, outlineColor: controller.selectedIndex.value == index
                    ? AppColors.creamColor
                    : Colors.grey.shade300,interestModel: controller.interestList[index],
                ),
              ),
          )).paddingSymmetric(vertical: margin_15,horizontal: margin_18),
    ),
  );


  Widget _startButton() =>  SafeArea(
    child: Container(decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0.0, -1.0),
            blurRadius: 3.0//(x,y)
        ),
      ],
    ),
      padding: EdgeInsets.only(top: margin_10),
      child: MaterialButtonWidget(
        buttonBgColor: AppColors.appColor,
        onPressed: () {
          Get.offAllNamed(AppRoutes.mainViewRoute);
        },
        buttonText: strStart,textColor: Colors.white,
      ).paddingSymmetric(horizontal: margin_15).marginOnly(bottom: margin_10),
    ),
  );
}