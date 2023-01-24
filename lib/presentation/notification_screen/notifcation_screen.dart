import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final _items = List<String>.generate(5, (i) => 'Offers${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: offBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.local_offer,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _items.length,
                itemBuilder: ((context, index) {
                  final String items = _items[index];
                  return Dismissible(
                    key: Key(items),
                    onDismissed: (direction) {},
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.delete),
                    ),
                    child: ListTile(
                      leading: LottieBuilder.asset(
                          'assets/lottie_animation/giftbox.json'),
                      title: Text(_items[index]),
                      subtitle: const Text('Summer offer flat 50%'),
                    ),
                  );
                }),
                separatorBuilder: (_, int index) {
                  return const Divider();
                },
              ),
            )
          ],
        ));
  }
}
