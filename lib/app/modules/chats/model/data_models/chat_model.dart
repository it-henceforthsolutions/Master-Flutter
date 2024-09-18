
import '../../../authentication/models/dataModel/login_data_model.dart';

class ChatModel {
  var text;
  var type;
  var time;
  var status;
  var msgType;
  DateTime createdOn;
  LoginDataModel? user;
  ChatModel({required this.createdOn,this.text, this.type, this.time, this.status, this.msgType,this.user});
}