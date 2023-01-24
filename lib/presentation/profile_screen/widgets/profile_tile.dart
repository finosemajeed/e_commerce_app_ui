import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';
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
          showDialog(
              context: context,
              builder: ((ctx) {
                return AlertDialog(
                  content: const Text(
                      'Are your sure you want to logout from this app?'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        AuthentificationService().signOut();
                      },
                      child: Container(
                        color: offOrange,
                        padding: const EdgeInsets.all(14),
                        child: const Text("Logout"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: orange,
                        padding: const EdgeInsets.all(14),
                        child: const Text("Continue shopping"),
                      ),
                    ),
                  ],
                );
              }));
        },
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
