import 'package:amazon_clone/componments/botton_bar.dart';
import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyAppWrapper(),
    ),
  );
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      home: Scaffold(
        body: MyApp(),
      ),
    );
  }
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
        home: Scaffold(
          backgroundColor: Colors.white60,
          body: FutureBuilder(
            future: fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('assets/Animation.json'),
                    ),
                  ],
                ); // or some loading screen
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              // Wrap the part of the widget tree you want to rebuild with a Consumer<UserProvider>
              return Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  print(userProvider.user.type);
                  if (userProvider.user.token.isNotEmpty &&
                      userProvider.user.type == "user") {
                    return const BottonBar();
                  } else if (userProvider.user.token.isNotEmpty &&
                      userProvider.user.type != "user") {
                    return const AdminScreen();
                  } else {
                    return const AuthScreen();
                  }
                },
              );
            },
          ),
        ));
  }
}

// import 'package:amazon_clone/componments/botton_bar.dart';
// import 'package:amazon_clone/constants/global_veriables.dart';
// import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
// import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
// import 'package:amazon_clone/features/auth/services/auth_service.dart';
// import 'package:amazon_clone/providers/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'router.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(
//       create: (context) => UserProvider(),
//     )
//   ], child: const MyApp()));
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   AuthService authService = AuthService();
//
//   Future<void> fetchUserData() async {
//     await authService.getUserData(context);
//   }
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Amazon Clone',
//       theme: ThemeData(
//         scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//         colorScheme: const ColorScheme.light(
//           primary: GlobalVariables.secondaryColor,
//         ),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.black),
//         ),
//       ),
//       onGenerateRoute: (setttings) => generateRoute(setttings),
//       home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//           ? Provider.of<UserProvider>(context).user.type == 'user'
//               ? const BottonBar()
//               : const AdminScreen()
//           : const AuthScreen(),
//     );
//   }
// }
