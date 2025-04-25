import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  bool isTextEntered = false;
  final TextEditingController _textController =
      TextEditingController(); // Define the text controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageBubble(_messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child:
                // CustomTextField(fieldLabel: 'Write a message...', hint: "Write a message...", isFilled: true,)

                TextField(
              controller: _textController, // Use the text controller
              onSubmitted: _handleSubmitted,
              onChanged: (text) {
                setState(() {
                  isTextEntered = text.trim().isNotEmpty; // Update the variable based on text input
                });
              },
              decoration: InputDecoration(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: isTextEntered ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              isTextEntered ? _handleSubmitted(_textController.text) : null;
              olor:
              isTextEntered ? _handleSubmitted(_textController.text.trim()) : null;
            },
          ),
        ],
      ),
    );
  }

//   void _handleSubmitted(String text) {
//     if (text.isNotEmpty) {
//       Message newMessage = Message(text, 'You');
//       setState(() {
//         _messages.add(newMessage);
//       });
//       _textController.clear();
//     }
//   }
// }
  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      Message senderMessage = Message(text, 'You');
      Message receiverMessage = Message(text, 'Receiver'); // Create a message for the receiver
      setState(() {
        _messages.add(senderMessage);
        _messages.add(receiverMessage); // Add both sender's and receiver's messages
        _textController.clear();
        isTextEntered = false; // Reset the variable when sending a message
      });
    }
  }
}

class Message {
  final String text;
  final String sender;

  Message(this.text, this.sender);
}

class MessageBubble extends StatelessWidget {
  final Message message;

  MessageBubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: message.sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: message.sender == 'You' ? AppColors.KFormfieldBlueFill : Colors.white,
              borderRadius: BorderRadius.circular(10.7.r),
              border: Border.all(
                  color: message.sender == 'You' ? Colors.transparent : AppColors.KDivider)),
          child: TextView(
            text: message.text,
            color: AppColors.KUserProfileNeutral,
            fontSize: 14.spMin,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
