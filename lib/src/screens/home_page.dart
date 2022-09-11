import 'package:appcs/src/providers/bottom_provider.dart';
import 'package:appcs/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text("Cursos Y Seminarios"),
        )),
        body: const SafeArea(
          child: _HomePageBody(),
          // child: ,
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProiver = Provider.of<BottomProvider>(context);
    final currentIndex = uiProiver.selectedIndex;
    switch (currentIndex) {
      case 0:
        return const CustomCardArticle();
      case 1:
        return const PerfilScreen();
      default:
        return const PerfilScreen();
    }
  }
}
