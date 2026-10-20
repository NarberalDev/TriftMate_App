import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String message;
  final int checkStatus;

  const ChatItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.message,
    required this.checkStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (checkStatus == 1)
            const Icon(
              Icons.check,
              color: Colors.grey,
              size: 20,
            ),

          if (checkStatus == 2)
            const Icon(
              Icons.done_all,
              color: Colors.grey,
              size: 20,
            ),

          if (checkStatus == 3)
            const Icon(
              Icons.done_all,
              color: Colors.blue,
              size: 20,
            ),
        ],
      ),
    );
  }
}