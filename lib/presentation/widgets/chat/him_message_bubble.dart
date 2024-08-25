import 'package:chat_message_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HimMessageBubble extends StatelessWidget {
  const HimMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              //'Get The Hell Out Of Here And Be A Goddamn Man!',
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble(message.imageUrl!),
        const Text(
          '10:59 AM',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: size.width * 0.3,
        height: size.width * 0.3,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.3,
            height: size.width * 0.3,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: const Text('Cargando Imagen...'),
          );
        },
      ),
    );
  }
}
