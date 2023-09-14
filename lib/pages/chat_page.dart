import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isWriting = false;

  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              maxRadius: 14,
              child: const Text('BE', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            const Text('Benito Martinez',
                style: TextStyle(color: Colors.black87, fontSize: 12)),
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),

            const Divider(height: 1),

            //TODO: Text box
            Container(
              color: Colors.white,
              height: 100,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (String text) {
                    //TODO: if there is a value post button is enabled
                    setState(() {
                      if (text.trim().isNotEmpty) {
                        _isWriting = true;
                      } else {
                        _isWriting = false;
                      }
                    });
                  },
                  decoration:
                      const InputDecoration.collapsed(hintText: 'Send message'),
                  focusNode: _focusNode,
                ),
              ),

              //TODO: Send button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Platform.isIOS
                    ? CupertinoButton(
                        onPressed: _isWriting
                            ? () => _handleSubmit(_textController.text)
                            : null,
                        child: const Text('Send'),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconTheme(
                            data: IconThemeData(color: Colors.blue[400]),
                            child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              icon: Icon(Icons.send, color: Colors.blue[400]),
                              onPressed: _isWriting
                                  ? () => _handleSubmit(_textController.text)
                                  : null,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          )),
    );
  }

  _handleSubmit(String text) {
    if (text.trim().isEmpty) return;
    //print(text);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
        uid: '123',
        text: text,
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 200)));

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    //TODO: turn off socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
