import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          actions: [
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu, color: Colors.black),
                  Assets.images.logo.image(height: size.height / 13.6),
                  const Icon(Icons.search, color: Colors.black),
                ],
              ),
            ),
          ]),
      body: Stack(children: [
        Positioned.fill(
          child: IndexedStack(index: selectedPageIndex, children: [
            HomeScreen(size: size, bodyMargin: bodyMargin), //0
            ProfileScreen(size: size, bodyMargin: bodyMargin), //1
          ]),
        ),
        BottomNavigation(
          size: size,
          bodyMargin: bodyMargin,
          changeScreen: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
        ),
      ]),
    ));
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 12,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
              height: size.height / 8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.bottomNav),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => changeScreen(0),
                      icon: ImageIcon(Assets.icons.home.provider(),
                          color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(Assets.icons.write.provider(),
                          color: Colors.white)),
                  IconButton(
                      onPressed: () => changeScreen(1),
                      icon: ImageIcon(Assets.icons.user.provider(),
                          color: Colors.white)),
                ],
              )),
        ),
      ),
    );
  }
}
// HomeScreen(size: size, bodyMargin: bodyMargin)
