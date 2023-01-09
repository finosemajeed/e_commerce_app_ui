import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.tittle,
    required this.icon,
  }) : super(key: key);

  final String tittle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      title: Text('Settings'),
      leading: Icon(icon),
      trailing: Icon(Icons.keyboard_arrow_right_outlined),
    );
  }
}
