
import '../../../authentication/models/dataModel/login_data_model.dart';

class ChatHistoryModel {
  var text;
  var type;
  var time;
  var status;
  var msgType;
  int unReadMsgCount;
  LoginDataModel? user;
  ChatHistoryModel({this.text, this.type, this.time, this.status, this.msgType,this.user,this.unReadMsgCount=0});
}