import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/browse_apps_screen.dart';
import 'screens/playbook_setup_screen.dart';
import 'screens/about_screen.dart';
import 'screens/settings_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    HomeScreen(),
    BrowseAppsScreen(),
    PlaybookSetupScreen(),
    AboutScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;
        if (isWide) {
          return Scaffold(
            body: Row(
              children: [
                SizedBox(
                  width: 240,
                  child: NavigationRail(
                    extended: true,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) =>
                        setState(() => _selectedIndex = index),
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: Text('Dashboard'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.apps_outlined),
                        selectedIcon: Icon(Icons.apps),
                        label: Text('Browse Packages'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.security_outlined),
                        selectedIcon: Icon(Icons.security),
                        label: Text('Playbooks'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.info_outline),
                        selectedIcon: Icon(Icons.info),
                        label: Text('About'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings_outlined),
                        selectedIcon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(child: _pages[_selectedIndex]),
              ],
            ),
          );
        }
        // Bottom NavigationBar for narrow layouts
        return Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) =>
                setState(() => _selectedIndex = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.apps_outlined),
                selectedIcon: Icon(Icons.apps),
                label: 'Browse Packages',
              ),
              NavigationDestination(
                icon: Icon(Icons.security_outlined),
                selectedIcon: Icon(Icons.security),
                label: 'Playbooks',
              ),
              NavigationDestination(
                icon: Icon(Icons.info_outline),
                selectedIcon: Icon(Icons.info),
                label: 'About',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
