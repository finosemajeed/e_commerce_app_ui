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
      title: Text(
        'Welcome',
        style: TextStyle(color: Colors.black26),
      ),
      subtitle: Text(
        'Mr. $userName',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.logout),
      ),
    );
  }
}
