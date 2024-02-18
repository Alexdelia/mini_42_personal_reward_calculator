import 'package:flutter/material.dart';
import 'package:mini_42_personal_reward_calculator/page/home/main.dart';
// import 'package:mini_42_personal_reward_calculator/src/rust/api/simple.dart';
import 'package:mini_42_personal_reward_calculator/src/rust/frb_generated.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

Future<void> main() async {
  await RustLib.init();
  pref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  void toggleTheme(Brightness brightness) {
    setState(() {
      // log the current themeMode
      print('ThemeMode: $themeMode, Brightness: $brightness');
      themeMode =
          brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     home: Scaffold(
    //       appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
    //       body: Center(
    //         child: Text(
    //             'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
    //       ),
    //     ),
    //   );
    // }
    return MaterialApp(
        title: '42 Reward Calculator',
        themeMode: themeMode,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(toggleTheme: toggleTheme));
  }
}
