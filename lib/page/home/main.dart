import 'package:flutter/material.dart';
import 'package:mini_42_personal_reward_calculator/page/home/reward.dart';
import 'package:mini_42_personal_reward_calculator/page/home/xp.dart';

class HomePage extends StatefulWidget {
  final void Function(Brightness brightness) toggleTheme;

  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int xp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('HomePage'),
        // action to change the theme
        actions: <Widget>[
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            onPressed: () {
              widget.toggleTheme(Theme.of(context).brightness);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            XpField(
              onChanged: (String value) {
                setState(() {
                  xp = int.tryParse(value) ?? 0;
                });
              },
            ),
            RewardField(xp: xp),
          ],
        ),
      ),
    );
  }
}
