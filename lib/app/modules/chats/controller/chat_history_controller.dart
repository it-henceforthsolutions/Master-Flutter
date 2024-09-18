/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/modules/chats/model/data_models/chat_histroy_model.dart';

import '../../../export.dart';

class ChatHistoryController extends BaseController {
  late TextEditingController searchController;
  late FocusNode focusNode;

  RxBool showSearch = false.obs;


  void handleAnimation() async {
    if (showSearch.value) {
      focusNode.unfocus();

      showSearch.value = false;
    } else {
      showSearch.value = true;
    }
  }

  RxList<ChatHistoryModel> chatHistoryList = <ChatHistoryModel>[
    ChatHistoryModel(
        text: 'Hello How are you',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 2,

        time: '09:00'),
    ChatHistoryModel(
        text: 'I am good',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 0,
        type: typeSent,
        time: '09:00'),
    ChatHistoryModel(
        text: 'Hello How are you',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 2,

        time: '09:00'),
    ChatHistoryModel(
        text: 'I am good',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 0,
        type: typeSent,
        time: '09:00'),
    ChatHistoryModel(
        text: 'Hello How are you',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 2,

        time: '09:00'),
    ChatHistoryModel(
        text: 'I am good',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 0,
        type: typeSent,
        time: '09:00'),
    ChatHistoryModel(
        text: 'Hello How are you',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 2,

        time: '09:00'),
    ChatHistoryModel(
        text: 'I am good',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 0,
        type: typeSent,
        time: '09:00'),
    ChatHistoryModel(
        text: 'Hello How are you',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 2,

        time: '09:00'),
    ChatHistoryModel(
        text: 'I am good',
        user: LoginDataModel(
          image: iconsIcUser,
          name: 'Sofia',
        ),
        unReadMsgCount: 0,
        type: typeSent,
        time: '09:00'),

  ].obs;

  @override
  void onInit() {
    _initControllers();
    super.onInit();
  }

  void _initControllers() {
    searchController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {

    _disposeControllers();
    super.onClose();
  }

  void _disposeControllers() {
    searchController.dispose();
    focusNode.dispose();
  }
}
