import 'package:e_comerce_app_ui/domain/login_screen/login_auth_function.dart';
import 'package:e_comerce_app_ui/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.userName,
    required this.profileImage,
  }) : super(key: key);
  final String userName;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
      ),
      title: const Text(
        'Welcome',
        style: TextStyle(color: Colors.black26),
      ),
      subtitle: Text(
        'Mr. $userName',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          LoginAuthFunction.logoutUser();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: ((context) => LoginScreen())),
              (route) => false);
        },
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
