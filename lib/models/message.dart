import 'package:chat_app/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message,this.id);
  //i will put factory constructor because the data returned is json data
  // factory Message.fromJson(jsonData) {
  //   return Message(jsonData[kMessage], jsonData['id']);
  // }
  factory Message.fromJson(jsonData) {
  return Message(
    jsonData[kMessage] ?? '', // Use a default value if kMessage is null
    jsonData['id'] ?? '',
  );
}
}