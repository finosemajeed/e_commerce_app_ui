import 'package:e_comerce_app_ui/presentation/home_screen/widgets/service_card.dart';
import 'package:flutter/material.dart';

class CustomServiceCardArea extends StatelessWidget {
  const CustomServiceCardArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          ServiceCard(
            icon: Icons.electric_bike,
            text: 'Flash Sale',
          ),
          ServiceCard(
            icon: Icons.blinds_closed,
            text: 'Bill',
          ),
          ServiceCard(
            icon: Icons.games_outlined,
            text: 'Game',
          ),
          ServiceCard(
            icon: Icons.card_giftcard,
            text: 'Daily Gift',
          ),
          ServiceCard(
            icon: Icons.more_outlined,
            text: 'More',
          )
        ],
      ),
    );
  }
}
