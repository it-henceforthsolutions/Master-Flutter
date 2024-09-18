import '../../../export.dart';
import '../model/data_models/chat_model.dart';

class ChatScreenController extends GetxController {
  RxMap<DateTime, List<ChatModel>> groupedMessages =
      <DateTime, List<ChatModel>>{}.obs;

  late TextEditingController chatMessageController;
  late FocusNode chatFocusNode;

  RxString chatMessage = ''.obs;

  Timer? timer;
  RxBool isLive= false.obs;

  LoginDataModel userModel = LoginDataModel(
    image: iconsIcUser2,
    name: 'Jessie Pinkmen 👑',
  );

  final RxList<ChatModel> _messageList = [
    ChatModel(
        text: 'Hello, Jacob 👋',
        type: typeReceived,
        time: '10:00 AM',
        user: LoginDataModel(name: 'Savannah', image: iconsIcUser2),
        createdOn: DateTime.now().subtract(Duration(days: 1)),
        status: strSeen),
    ChatModel(
        text: 'Hello, Jacob 👋',
        type: typeSent,
        time: '10:00 AM',
        user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
        createdOn: DateTime.now(),
        status: strSeen),
    ChatModel(
      text: 'Hello John, How are you?',
      type: typeReceived,
      user: LoginDataModel(name: 'Savannah', image: iconsIcUser2),
      time: '10:01 AM',
      createdOn: DateTime.now(),
    ),
    ChatModel(
        text: 'I m fine what about you?',
        type: typeSent,
        user: LoginDataModel(name: 'Savannah', image: iconsIcUser2),
        createdOn: DateTime.now().subtract(Duration(days: 1)),
        time: '10:03 AM',
        status: strDelivered),
    ChatModel(
      text: 'I\'m also fine. Thanks!',
      type: typeReceived,

      user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
      createdOn: DateTime.now().subtract(Duration(days: 1)),
      time: '10:04 AM',
    ),
    ChatModel(
      text: 'I\'m also fine. Thanks!',
      type: typeReceived,
      msgType: typeVideo,
      user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
      createdOn: DateTime.now().subtract(Duration(days: 1)),
      time: '10:04 AM',
    ),
    ChatModel(
      text: 'What\'s your today plan?',
      type: typeSent,
      time: '10:04 AM',
      user: LoginDataModel(name: 'Savannah', image: iconsIcUser2),
      createdOn: DateTime.now().subtract(Duration(days: 3)),
      status: strSent,
    ),
    ChatModel(
      text: 'Hello John, How are you?',
      type: typeReceived,
      user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
      time: '10:01 AM',
      createdOn: DateTime.now(),
    ),
    ChatModel(
        text: 'I m fine what about you?',
        type: typeSent,
        createdOn: DateTime.now().subtract(Duration(days: 1)),
        time: '10:03 AM',
        user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
        status: strDelivered),
    ChatModel(
      text: 'I\'m also fine. Thanks!',
      type: typeSent,
      msgType: typeVideo,
      user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
      time: '10:04 AM',
      createdOn: DateTime.now(),
    ),
    ChatModel(
      text: 'I\'m also fine. Thanks!',
      type: typeSent,
      user: LoginDataModel(name: 'Rio', image: iconsIcUser2),
      time: '10:04 AM',
      createdOn: DateTime.now(),
    ),
    ChatModel(
      text: 'What\'s your today plan?',
      type: typeSent,

      user: LoginDataModel(name: 'Savannah', image: iconsIcUser2),
      time: '10:04 AM',
      createdOn: DateTime.now().subtract(Duration(days: 3)),
      status: strSent,
    ),
  ].obs;

  @override
  void onInit() {
    _initControllers();
    _getArgs();
    super.onInit();
  }

  @override
  void onReady() {
    timer=Timer.periodic(Duration(seconds: 3), (timer) {
      isLive.value=!(isLive.value);
    });
    _createGroup();
    super.onReady();
  }

  String get getAllUserName {
    List names = [];
    return names.join(', ').trim();
  }

  void _createGroup() {
    _messageList.sort((b, a) => b.createdOn.compareTo(a.createdOn));
    for (ChatModel message in _messageList) {
      DateTime day = DateTime(message.createdOn!.year, message.createdOn!.month,
          message.createdOn!.day);

      if (!groupedMessages.containsKey(day)) {
        groupedMessages[day] = [];
      }

      groupedMessages[day]!.add(message);
    }
  }

  String getDayLabel(DateTime day) {
    DateTime now = DateTime.now();
    if (day.year == now.year && day.month == now.month && day.day == now.day) {
      return 'Today';
    } else if (day.year == now.year &&
        day.month == now.month &&
        day.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return '${day.day}/${day.month}/${day.year}';
    }
  }

  void _getArgs() {
    if (Get.arguments != null) {}
  }

  void showMenuWidget(Offset globalPosition) {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    showMenu(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(margin_8)),
      context: Get.overlayContext!,
      position: RelativeRect.fromLTRB(left, top + 10, margin_25, 0),
      items: [
        const PopupMenuItem<String>(
          height: 10,
          value: strBlock,
          child: TextView(
            text: strBlock,
          ),
        ),
        PopupMenuItem<String>(
            height: 15,
            value: strShare,
            child: Divider(
              color: Colors.grey.withOpacity(.5),
            )),
        const PopupMenuItem<String>(
          height: 10,

          value: strReport,
          child: TextView(
            text: strReport,
          ),
        ),
      ],
      elevation: 8.0,
    );
  }


  @override
  void onClose() {
    timer?.cancel();
    _disposeControllers();
    super.onClose();
  }

  void _initControllers() {
    chatMessageController = TextEditingController();

    chatFocusNode = FocusNode();
  }

  void _disposeControllers() {
    chatMessageController.dispose();

    chatFocusNode.dispose();
  }
}
