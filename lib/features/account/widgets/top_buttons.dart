import 'package:Agricon/features/account/widgets/account_button.dart';
import 'package:Agricon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
   final AuthService authService = AuthService();

    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your Orders", onPressed: () {}),
            AccountButton(text: "Buy Again", onPressed: () {})
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(text: "Log Out", onPressed: () {
              showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          "Are you Sure?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        content: const Text(
                          "This will log out from this device",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              authService.logoutUser(context: context);
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );
            }),
            AccountButton(text: "Saved", onPressed: () {}),
          ],
        )
      ],
    );
  }
}
