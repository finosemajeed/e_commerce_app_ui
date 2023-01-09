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
        onPressed: () {},
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
