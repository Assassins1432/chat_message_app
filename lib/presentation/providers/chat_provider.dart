import 'package:chat_message_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_message_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hi!', fromWho: FromWho.me),
    Message(text: 'What are you doing Arthur?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      himReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> himReply() async {
    final himMessage = await getYesNoAnswer.getAnswer();
    messageList.add(himMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutQuad,
    );
  }
}
