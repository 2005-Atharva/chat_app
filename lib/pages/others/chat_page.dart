import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/services/functions/auth_service.dart';
import 'package:user_crud9/services/functions/chat_service.dart';
import 'package:user_crud9/widgets/global/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String reciverID;
  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.reciverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat & auth services
  final ChatService _chatService = ChatService();

  final AuthService _authService = AuthService();

  //textfield for focus
  FocusNode myfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    //add a listener to focus node
    myfocusNode.addListener(
      () {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      },
    );

    //wait a bit for
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myfocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  //send message
  void sendMessage() async {
    //if there something to sent
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.reciverID, _messageController.text);

      _messageController.clear();
    }

    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 37, 58, 193),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          widget.receiverEmail,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 37, 58, 193),
          ),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.call_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.videocam_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //display all mesages
          Expanded(
            child: _buildMessageList(),
          ),

          _buildUserInput(),

          //user input
        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(widget.reciverID, senderID),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return const Center(
            child: Text("E R R O R"),
          );
        }

        //laoding
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //return list view
        return ListView(
          padding: const EdgeInsets.only(bottom: 5),
          controller: _scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    //align message to the right if sender is the current user , otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
          )
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //textfield
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(97, 187, 222, 251),
                  hintText: " Type Something...",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                focusNode: myfocusNode,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 15, left: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.center,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward_sharp,
                  size: 24,
                  weight: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
