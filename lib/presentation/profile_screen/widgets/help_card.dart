
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: offOrange,
        ),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.headset_mic_outlined,
              color: orange,
              size: 40,
            ),
            SizedBox(width: 20),
            Text(
              'How can we help you?',
              style: TextStyle(
                color: orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );
  }
}