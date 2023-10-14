import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Deine Bestellungen", onPressed: () {}),
            AccountButton(text: "Wunschliste", onPressed: () {})
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(text: "Kontakt Verkäufer", onPressed: () {}),
            AccountButton(text: "Ausloggen", onPressed: () {}),
          ],
        )
      ],
    );
  }
}
