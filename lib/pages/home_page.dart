import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_crud9/pages/others/chat_page.dart';
import 'package:user_crud9/pages/others/user_page.dart';
import 'package:user_crud9/services/functions/auth_service.dart';
import 'package:user_crud9/services/functions/chat_service.dart';
import 'package:user_crud9/services/models/user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logOut() async {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final String? currentUserEmail = _authService.getCurrentUser()?.email;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '  Whatsapp',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 37, 58, 193),
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 5),
          //   child: IconButton(
          //     color: Colors.red.shade500,
          //     onPressed: logOut,
          //     icon: const Icon(
          //       Icons.logout_outlined,
          //       size: 30,
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 37, 58, 193),
              ),
              child: IconButton(
                color: const Color.fromARGB(255, 37, 58, 193),
                onPressed: () {
                  if (currentUserEmail != null && currentUserEmail.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          currentUserEmail: currentUserEmail,
                        ),
                      ),
                    );
                  } else {
                    // Handle the case where the email is null or empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User email is not available.'),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return const Center(
            child: Text("Unexpected Error Occure!"),
          );
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //return listview
        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userData) => _buildUserListItem(userData, context),
              )
              .toList(),
        );
      },
    );
  }

  //build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all user except current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          //tapped  to go on chat page -->>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                reciverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
