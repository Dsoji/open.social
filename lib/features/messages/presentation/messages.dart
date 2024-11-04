import 'package:flutter/material.dart';
import 'package:opensocial/features/messages/presentation/chat_screen.dart';

import '../data/message_model.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: MessagesWidget(),
    );
  }
}

class MessagesWidget extends StatelessWidget {
  final List<Message> messages = [
    Message(
      name: 'Toluwani Adewumi',
      message: 'Hey beuatiful.',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    Message(
      name: 'Chris Walker',
      message: 'Something cheesy',
      imageUrl: 'https://i.pravatar.cc/150?img=2',
    ),
    Message(
      name: 'Ava Johnson',
      message: 'Are you hungry?',
      imageUrl: 'https://i.pravatar.cc/150?img=3',
    ),
    Message(
      name: 'Ella Yoon',
      message: 'Be ready by 8pm',
      imageUrl: 'https://i.pravatar.cc/150?img=4',
    ),
    Message(
      name: 'Mason Philippe',
      message: 'I miss you.',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
  ];

  MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                        name: message.name, imageUrl: message.imageUrl)));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(message.imageUrl),
              radius: 20,
            ),
            title: Text(
              message.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(message.message),
            trailing: const Icon(Icons.circle, color: Colors.purple, size: 12),
          ),
        );
      },
    );
  }
}
