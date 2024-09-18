/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/core/widget/app_bar_widget.dart';
import 'package:engagely/app/core/widget/ripple.dart';
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/settings/models/request_models/account_information_model.dart';
import 'package:engagely/app/modules/settings/widgets/settings_item_view.dart';

class SettingView extends BaseView<SettingsController> {
  SettingView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBarWidget(
      appBarTitleText: strSettings,
      isCustom: false,
      bgColor: Colors.white,
      isbackIcon: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _listView(),
        _divider(),
        _deleteAccount(),
      ]),
    );
  }

  Widget _listView() => ListView.separated(
      separatorBuilder: (ctx, index) {
        return Divider(
          color: Colors.grey.shade300,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.listItems.length,
      itemBuilder: (context, index) {
        AccountInfoModel item = controller.listItems[index];
        return SettingsItemView(
          accountInfoModel: item,
          onTap: () {
            if(item.title==strLogOut){
              controller.logoutDialog();
            }else {
              Get.toNamed(item.route ?? "", arguments: item.arguments);
            }
          },
        );
      }).paddingSymmetric(horizontal: margin_15, vertical: margin_10);

  Widget _divider() => Divider(
        color: Colors.grey.shade300,
        indent: margin_15,
        endIndent: margin_15,
      );

  Widget _deleteAccount() => ButtonWidget(onTap: (){
    controller.deleteAccountDialog();
  },
    child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_20),
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          decoration: BoxDecoration(
              color: AppColors.redColorAccent.withOpacity(.15),
              borderRadius: BorderRadius.circular(margin_8)),
          child: Row(
            children: [
              Expanded(
                  child: TextView(
                text: strDeleteAccount,
                textStyle: textStyleBodyLarge().copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: font_16,
                    color: AppColors.redColorAccent),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.redColorAccent,
                size: margin_15,
              ),
            ],
          ).paddingSymmetric(vertical: margin_15),
        ),
  );
}
