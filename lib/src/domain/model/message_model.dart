class MessageModel {
  MessageModel({
    this.idMessage,
    this.sendby,
    this.messages,
    this.time,
    this.type,
  });

  MessageModel.fromJson(dynamic json) {
    idMessage = json['Id_Message'];
    sendby = json['Sendby'];
    messages = json['Messages'];
    time = json['Time'];
    type = json['Type'];
  }
  int? idMessage;
  int? sendby;
  String? messages;
  String? time;
  int? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_Message'] = idMessage;
    map['Sendby'] = sendby;
    map['Messages'] = messages;
    map['Time'] = time;
    map['Type'] = type;
    return map;
  }
}
