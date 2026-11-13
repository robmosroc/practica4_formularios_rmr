import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/paises_grid_screen.dart';
import 'package:paisesgui/ui/screens/paises_list_screen.dart';

class PaisesScreen extends StatefulWidget {
  const PaisesScreen({super.key});

  @override
  State<PaisesScreen> createState() => _PaisesScreenState();
}

class _PaisesScreenState extends State<PaisesScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String nombreContinente =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Europa';
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final List<Widget> pantallas = [
      PaisesListScreen(nombreContinente),
      PaisesGridScreen(nombreContinente),
    ];

    if (!isLandscape) {
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
              icon: Icon(Icons.view_list_outlined),
              selectedIcon: Icon(Icons.view_list),
              label: 'Lista',
            ),
            NavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view),
              label: 'Grid',
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _currentIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all, // Muestra los textos debajo de los iconos
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.view_list_outlined),
                  selectedIcon: Icon(Icons.view_list),
                  label: Text('Lista'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.grid_view_outlined),
                  selectedIcon: Icon(Icons.grid_view),
                  label: Text('Grid'),
                ),
              ],
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ), // Línea divisoria vertical opcional
            // El Expanded es obligatorio para que la pantalla ocupe todo el espacio restante
            Expanded(child: pantallas[_currentIndex]),
          ],
        ),
      );
    }
  }
}
