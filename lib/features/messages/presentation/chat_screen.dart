import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data/chat_model.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final List<ChatModel> messages = List.generate(
    20,
    (index) => ChatModel(
      content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. $index",
      isSentByMe: index % 2 == 0, // Alternating sent and received messages
    ),
  );

  ChatScreen({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 221, 229),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 20,
            ),
            const Gap(10), // Add spacing between the avatar and the name
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Align(
            alignment: message.isSentByMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.8, // Max width to 80% of screen width
              ),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: message.isSentByMe
                    ? const Color(0xFFFEC627)
                    : const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message.content),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 221,
                      229), // Adjust the color to match your design
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Send a message',
                    labelStyle:
                        TextStyle(color: Colors.white), // Style for the label
                    border: InputBorder.none, // No border
                    enabledBorder: UnderlineInputBorder(
                      // Underline border when the TextField is enabled
                      borderSide: BorderSide(
                          color: Colors.transparent), // Transparent border
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Underline border when the TextField is focused
                      borderSide: BorderSide(
                          color: Colors.transparent), // Transparent border
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.grey,
              ),
              onPressed: () {
                // Add send functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  const ExpandableTextWidget({
    super.key,
    required this.text,
    required this.maxLines,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'View Less' : 'View More',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
