import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProiver = Provider.of<BottomProvider>(context);
    return BottomNavigationBar(
      currentIndex: uiProiver.selectedIndex,
      onTap: (value) {
        uiProiver.selectedIndex = value;
      },
      items: const [
        BottomNavigationBarItem(label: "Inicio", icon: Icon(Icons.newspaper)),
        BottomNavigationBarItem(
            label: "Perfil", icon: Icon(Icons.person_pin_sharp))
      ],
    );
  }
}
