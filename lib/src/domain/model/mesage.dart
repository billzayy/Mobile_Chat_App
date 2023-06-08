class MessageData {
  String chatId;
  String? sendBy;
  String? time;
  String? message;
  int? type;
  String? url;

  MessageData({
    required this.chatId,
    this.sendBy,
    this.time,
    this.message,
    this.type,
    this.url,
  });
}

// Tạo danh sách dữ liệu giả
List<MessageData> messageDataList = [
  MessageData(
    chatId: "8",
    sendBy: "id02",
    time: "12:01 PM",
    message: "Cảm ơn! Chúc bạn cũng có một buổi tối tốt lành!",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "7",
    sendBy: "id01",
    time: "12:00 PM",
    message: "Chúc ngủ ngon!",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "6",
    sendBy: "id02",
    time: "11:01 AM",
    message: "Không có gì, tôi rất vui được giúp bạn.",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "5",
    sendBy: "id01",
    time: "11:00 AM",
    message: "Cảm ơn bạn rất nhiều!",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "4",
    sendBy: "id02",
    time: "10:02 AM",
    message: "Tất nhiên! Tôi sẽ cố gắng giúp bạn.",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "3",
    sendBy: "id01",
    time: "10:00 AM",
    message: "Bạn có thể giúp tôi không?",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "2",
    sendBy: "id02",
    time: "9:01 AM",
    message: "Chào bạn!",
    type: 1,
    url: null,
  ),
  MessageData(
    chatId: "1",
    sendBy: "id01",
    time: "9:00 AM",
    message: "Xin chào!",
    type: 1,
    url: null,
  ),
];
