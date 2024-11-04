class ChatModel {
  final String content;
  final bool
      isSentByMe; // true if the ChatModel is sent by the user, false if received

  ChatModel({required this.content, required this.isSentByMe});
}

final List<ChatModel> ChatModels = List.generate(
  20,
  (index) => ChatModel(
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. $index",
    isSentByMe: index % 2 == 0, // Alternating sent and received ChatModels
  ),
);
