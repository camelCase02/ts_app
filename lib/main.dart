import 'package:amazon_clone/componments/botton_bar.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';

import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  Future<void> fetchUserData() async {
    await authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: FutureBuilder(
          future: fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Align( alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(backgroundColor: Colors.black,
                  color: Colors.red,
                ),
              ); // or some loading screen
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // Wrap the part of the widget tree you want to rebuild with a Consumer<UserProvider>
            return Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                if (userProvider.user.token.isNotEmpty) {
                  return const BottonBar();
                } else {
                 return const AuthScreen();
                }
                
              },
            );
          },
        ));
  }
}
