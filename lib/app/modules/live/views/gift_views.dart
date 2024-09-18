/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/live/controller/gitft_controller.dart';
import 'package:engagely/app/modules/live/widget/gifts_item_view.dart';

import '../../../export.dart';

class GiftView extends StatelessWidget {
  final bool? isCoin;

  const GiftView({super.key, this.isCoin=true});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GiftController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notchView(),
              _heading(),
              _aviableCoins(),
              _tabBar(),
              _tabView(),
            ],
          ).marginSymmetric(horizontal: margin_15);
        });
  }

  Widget _notchView() => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: margin_15),
          width: margin_60,
          height: height_5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(margin_5)),
        ),
      );

  Widget _heading() => TextView(
        text: strGift,
        textStyle: textStyleBodyLarge().copyWith(
            color: Colors.black,
            fontSize: font_18,
            fontWeight: FontWeight.w600),
      ).marginOnly(top: margin_10);

  _aviableCoins() => Container(
        padding:
            EdgeInsets.only(left: margin_15, top: margin_5, bottom: margin_5),
        margin: EdgeInsets.symmetric(vertical: margin_15),
        decoration: BoxDecoration(
            color: AppColors.creamColor,
            borderRadius: BorderRadius.circular(margin_30)),
        child: Row(children: [
          AssetImageWidget(iconsCoins,
              imageWidth: height_20,
              imageHeight: height_20,
              radiusAll: height_20),
          TextView(
            text: "800",
            textStyle: textStyleBodyLarge().copyWith(
                color: Colors.black,
                fontSize: font_14,
                fontWeight: FontWeight.w600),
          ).marginOnly(left: margin_5),
          Spacer(),
          _getDiamonds(),
        ]),
      );

  Widget _getDiamonds() => Container(
        padding: EdgeInsets.only(
            left: margin_5, top: margin_2, bottom: margin_2, right: margin_10),
        margin: EdgeInsets.only(right: margin_3),
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(margin_30)),
        child: Row(children: [
           Icon(
            Icons.add,size: margin_22,
            color: Colors.white,
          ),
          TextView(
            text: isCoin==true?strBuyCoins:strGetDiamonds,
            textStyle: textStyleBodyLarge().copyWith(
                color: Colors.white,
                fontSize: font_14,
                fontWeight: FontWeight.w600),
          ).marginOnly(left: margin_2,right: margin_3)
        ]),
      );

  _tabBar() => GetBuilder(
      init: GiftController(),
      builder: (GiftController controller) {
        return TabBar(
            indicatorColor: AppColors.appColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.appColor,
            labelStyle: textStyleBodyLarge().copyWith(
                color: AppColors.appColor,
                fontSize: font_14,
                fontWeight: FontWeight.w600),
            unselectedLabelColor: Colors.grey,
            controller: controller.tabController,
            onTap: (index) {
              controller.seletedIndex = index;
              debugPrint("selectedIndex ${controller.seletedIndex} ${index}");
              controller.update();
            },
            tabs: const [
              Tab(
                child: TextView(text: strPopular),
              ),
              Tab(
                child: TextView(text: strEmoji),
              ),
              Tab(
                child: TextView(text: strAnimated),
              ),
            ]).marginSymmetric(horizontal: margin_5);
      });

  _tabView() => GetBuilder(
      init: GiftController(),
      builder: (GiftController controller) {
        return Expanded(
          child: GridView.builder(
              itemCount: controller?.seletedIndex == 0
                  ? controller.listData.length
                  : controller.seletedIndex == 1
                      ? controller.listEmojiData.length
                      : controller.listAnmiatedData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: margin_15,
                  mainAxisSpacing: margin_15,
                  crossAxisCount: 4,
                  childAspectRatio: .8),
              itemBuilder: (context, index) {
                var item = controller?.seletedIndex == 0
                    ? controller.listData[index]
                    : controller.seletedIndex == 1
                        ? controller.listEmojiData[index]
                        : controller.listAnmiatedData[index];
                return GiftItemView(isEmoji:controller.seletedIndex,
                  icon: item.icon,
                  price: item.name,isCoin: isCoin!,
                );
              }).marginSymmetric(horizontal: margin_15, vertical: margin_10),
        );
      });
}
