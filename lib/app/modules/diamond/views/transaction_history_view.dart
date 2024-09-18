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
import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/diamond/controllers/transaction_history_controller.dart';
import 'package:engagely/app/modules/diamond/widgets/transaction_history_item.dart';

class TransactionHistoryView extends BaseView<TransactionHistoryController> {
  TransactionHistoryView({super.key});



  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return AppBarWidget(appBarTitleText: strTransactionHistory,isCustom: false,bgColor: Colors.white,isbackIcon: true,);
  }

  @override
  Widget body(BuildContext context) {
    return _transactionHistoryListView();
  }

  _transactionHistoryListView() => ListView.separated(separatorBuilder: (context,index){
    return Divider(color: Colors.grey.shade300,);
  },
      itemCount: 10,
      itemBuilder: (context, index) =>
           TransactionItemView(index: index).marginOnly(bottom: margin_10))
      .paddingSymmetric(horizontal: margin_20, vertical: margin_20);
}
