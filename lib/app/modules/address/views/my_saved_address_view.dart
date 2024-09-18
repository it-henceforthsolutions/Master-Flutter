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
import 'package:engagely/app/modules/address/widgets/address_item_view.dart';

class MySavedAddressView extends BaseView<MySavedAddressController> {
  MySavedAddressView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strSavedAddress,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget? floatingActionButton() {
    return ButtonWidget(
      onTap: () {
        Get.toNamed(AppRoutes.addNewAddressView);
      },
      child: Container(
        width: margin_50,
        height: margin_50,
        decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(margin_80)),
        child: Icon(
          Icons.add,
          size: margin_25,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return _myAddressList();
  }

  Widget _myAddressList() => ListView.separated(
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade400,
        ).marginOnly(bottom: margin_15);
      },
      itemCount: 2,
      itemBuilder: (ctx, index) {
        return AddressItemView(
          index: index,
          onTapEdit: () {
            Get.toNamed(AppRoutes.addNewAddressView,
                arguments: {isEditAddress: true});
          },
        );
      }).marginSymmetric(horizontal: margin_18, vertical: margin_15);
}
