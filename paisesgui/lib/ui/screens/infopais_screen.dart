import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/infopais_detalle.dart';
import 'package:paisesgui/ui/screens/infopais_general.dart';

class InfoPais extends StatefulWidget {
  const InfoPais({super.key});

  @override
  State<InfoPais> createState() => _InfoPaisState();
}

class _InfoPaisState extends State<InfoPais> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String nombrePais = ModalRoute.of(context)?.settings.arguments as String? ?? 'España';

    final List<Widget> pantallas = [
      InfoPaisGeneral(nombrePais),
      InfoPaisDetalle(nombrePais),
    ];

    return Scaffold(
      body: pantallas[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'General',
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            selectedIcon: Icon(Icons.sunny),
            label: 'Detalle',
          ),
        ],
      ),
    );
  }
}
