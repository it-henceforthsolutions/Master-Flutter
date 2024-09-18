import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/authentication/controllers/choose_interest_controller.dart';
import 'package:engagely/app/modules/authentication/widgets/interest_item_view.dart';

class ChooseYourIntersetView extends BaseView<ChooseYourInterestController> {
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
          Get.toNamed(AppRoutes.addPoupularBoradcastView);
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
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w700)),
        ),
      );

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headingTextView(),
        _interestGridView(),

        _doneButton(),
      ],
    );
  }

  Widget _headingTextView() => TextView(
        text: strChooseYourInterest,
        textStyle: textStyleHeadlineLarge()
            .copyWith(fontWeight: FontWeight.w700, fontSize: font_22),
      ).marginOnly(top: margin_5,left: margin_18,right: margin_18);

  _interestGridView() => Expanded(
        child: Obx(
          () => GridView.builder(
              itemCount: controller.interestList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: margin_10,
                  crossAxisSpacing: margin_10),
              itemBuilder: (context, index) => Obx(()=>
              ButtonWidget(onTap: (){
                  controller.selectedIndex.value = index;
                  controller.selectedIndex.refresh();
                },
                  child: InterestItemView(
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


  Widget _doneButton() =>  SafeArea(
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
            Get.toNamed(AppRoutes.addPoupularBoradcastView);
          },
          buttonText: strDone,textColor: Colors.white,
        ).paddingSymmetric(horizontal: margin_15).marginOnly(bottom: margin_10),
    )
  );
}
