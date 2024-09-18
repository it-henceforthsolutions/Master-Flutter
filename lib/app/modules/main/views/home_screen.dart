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
import 'package:engagely/app/modules/home/widget/near_by_user_item_view.dart';
import 'package:engagely/app/modules/home/widget/tab_item_view.dart';

import '../../../export.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      isCustom: true,
      titleView: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 3.0),
                blurRadius: 3.0 //(x,y)
                ),
          ],
        ),
        padding: EdgeInsets.only(bottom: margin_15),
        child: Container(
          child: Row(children: [
            ButtonWidget(
              onTap: () {},
              child: AssetImageWidget(
                iconsProfile,
                imageWidth: margin_40,
                imageHeight: margin_40,
              ),
            ),
            _searchView(),
            ButtonWidget(
              onTap: () {
                Get.toNamed(AppRoutes.notificationView);
              },
              child: AssetImageWidget(
                iconsNotification,
                imageWidth: margin_40,
                imageHeight: margin_40,
              ),
            )
          ]).marginSymmetric(horizontal: margin_15),
        ),
      ),
    );
  }

  _searchView() => Expanded(
        child: TextFieldWidget(
          hint: strSearch,
          readOnly: true,
          onTap: () {
            Get.toNamed(AppRoutes.searchView);
          },
          contentPadding: EdgeInsets.symmetric(
            vertical: margin_12,
          ),
          inputType: TextInputType.name,
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: margin_25,
          ).paddingOnly(left: margin_10),
          inputAction: TextInputAction.next,
          decoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_30),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          formatter: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          ],
        ).marginSymmetric(horizontal: margin_8),
      );

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_tabItems(), _interestGridView()],
      ),
    );
  }

  Widget _tabItems() => Row(
        children: [
          Expanded(
            child: _allButton(),
          ),
          SizedBox(
            width: margin_10,
          ),
          Expanded(
            child: _nearByButton(),
          ),
          SizedBox(
            width: margin_10,
          ),
          Expanded(
            child: _trendingButton(),
          ),
        ],
      ).marginSymmetric(horizontal: margin_15, vertical: margin_15);

  _allButton() => Obx(
        () => ButtonWidget(
          onTap: () {
            controller.selectedItem.value = 0;
          },
          child: TabItemView(
              title: strAll,
              isSelected: controller.selectedItem.value == 0 ? true : false),
        ),
      );

  _nearByButton() => Obx(
        () => ButtonWidget(
          onTap: () {
            controller.selectedItem.value = 1;
          },
          child: TabItemView(
              title: strNearby,
              isSelected: controller.selectedItem.value == 1 ? true : false),
        ),
      );

  _trendingButton() => Obx(
        () => ButtonWidget(
          onTap: () {
            controller.selectedItem.value = 2;
          },
          child: TabItemView(
              title: strTrending,
              isSelected: controller.selectedItem.value == 2 ? true : false),
        ),
      );

  _interestGridView() => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.data.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: margin_10,
            crossAxisSpacing: margin_10),
        itemBuilder: (context, index) => ButtonWidget(
          onTap: () {
            Get.toNamed(AppRoutes.otherProfileScreen,
                arguments: {dataKey: index});
          },
          child: NearByItemView(image: controller.data[index]),
        ),
      ).paddingSymmetric(vertical: margin_15, horizontal: margin_18);
}
