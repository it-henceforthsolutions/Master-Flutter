


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
import 'package:engagely/app/core/widget/loading_widget.dart';

import '../../export.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
   BaseView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? showErrorSnackBar(controller.errorMessage)
              : Container()),
          Container(),
        ],
      ),
    );

  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegionWidget(
      statusBarColor: statusBarColor(),bottomColor: navigationColor(),
      statusBarBrightness: statusBarBrightness(),
      child: pageScaffold(context),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return  body(context);
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return SizedBox();
  }

  Color pageBackgroundColor() {
    return Colors.white;
  }

  Color statusBarColor() {
    return Colors.white;
  }

   Color navigationColor() {
     return Colors.white;
   }


   Brightness statusBarBrightness() {
    return Brightness.dark;
  }


  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }


  Widget? drawer() {
    return null;
  }
}
