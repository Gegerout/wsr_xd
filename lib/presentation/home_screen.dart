import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mapController = MapController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: const Color(0xFF2C3043),
              destinations: [
            NavigationRailDestination(icon: Image.asset("assets/images/menu_icon.png"), label: Text("History"), selectedIcon: Image.asset("assets/images/menu_icon.png") ),
            NavigationRailDestination(icon: Image.asset("assets/images/favorites_icon.png"), label: Text("Favorites"), selectedIcon: Image.asset("assets/images/favorites_icon.png")),
            NavigationRailDestination(icon: Image.asset("assets/images/settings_icon.png"), label: Text("Settings"), selectedIcon: Image.asset("assets/images/settings_icon.png"))
          ], selectedIndex: selectedIndex),
          Expanded(
              child:
              OSMFlutter(
                  controller: mapController,
                initZoom: 12,
              )
          )
        ],
      ),
    );
  }
}
