import 'package:flutter/material.dart';
import 'package:flutter_app/models/blocked_apps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import 'package:flutter_app/ui_components/app_bar.dart'; 
import 'package:flutter_app/state_managers/blocked_apps.dart';

class BlockedAppsPage extends ConsumerStatefulWidget {
  const BlockedAppsPage({Key? key}) : super(key: key);

  @override
  _BlockedAppsState createState() => _BlockedAppsState();
}

class _BlockedAppsState extends ConsumerState<BlockedAppsPage> {
  List<AppInfo> _apps = []; // State variable to store list of apps
  List<AppInfo> _filteredApps = []; // Filtered list based on search
  bool _isLoading = true; // State to show a loading indicator
  String _searchQuery = ''; // Current search query

  @override
  void initState() {
    super.initState();
    _fetchApps();
  }

  // Fetch the installed apps
  Future<void> _fetchApps() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(
      false, // Include system apps if needed
      true, // Get app icons if needed
      "", // Filter by package name if needed
    );

    // Update the state with the fetched data
    setState(() {
      _apps = apps;
      _filteredApps = apps; // Initialize the filtered list
      _isLoading = false;
    });
  }

  // Filter the app list based on the search query
  void _filterApps(String query) {
    setState(() {
      _searchQuery = query;
      _filteredApps = _apps
          .where((app) => app.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final blockedAppNotifier = ref.watch(blockedAppNotifierProvider.notifier); // Watch notifier for loading state
    final blockedApps = ref.watch(blockedAppNotifierProvider); // Watch goals list

    return Scaffold(
      appBar: MyCustomAppBar(),
      body: _isLoading ? Center(child: CircularProgressIndicator()) // Show loading spinner
          : blockedAppNotifier.isLoading ? Center(child: CircularProgressIndicator()) // Show loading spinner
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Search bar
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Apps',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterApps, // Call filter function on text change
                  ),
                  SizedBox(height: 16), // Space between search bar and list

                  // App list
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredApps.length,
                      itemBuilder: (context, index) {
                        AppInfo app = _filteredApps[index];

                        // Skip items with package names that match specific prefixes
                        if (
                            app.packageName.startsWith('com.android') ||
                            app.packageName.startsWith('android.auto_generated') ||
                            app.icon == null
                        ) {
                            return SizedBox.shrink(); // Return an empty widget to skip rendering
                        }

                        // Check if the app is currently blocked
                        bool isBlocked = blockedApps.any((blockedApp) => blockedApp.packageName == app.packageName);

                        return ListTile(
                          leading: Image.memory(
                            app.icon!,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(app.name),
                          subtitle: Text(app.packageName),
                          trailing: Switch(
                            value: isBlocked,
                            onChanged: (bool value) {
                              setState(() {
                                if (value) {
                                  final newBlockedApp = BlockedApp()
                                    ..name = app.name
                                    ..packageName = app.packageName;
                                  blockedAppNotifier.addBlockedApp(newBlockedApp);
                                } else {
                                  // If the switch is turned off, remove the app from the blocked set
                                  blockedAppNotifier.removeBlockedAppsByPackageName(app.packageName);
                                }
                              });
                            },
                          ),
                          onTap: () {
                            // Toggle the value when the row is tapped
                            setState(() {
                              isBlocked = !isBlocked;
                              _toggleBlockedApp(app, isBlocked);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Add a separate function to handle the logic of adding or removing the blocked app
  void _toggleBlockedApp(AppInfo app, bool value) {
    setState(() {
      if (value) {
        final newBlockedApp = BlockedApp()
          ..name = app.name
          ..packageName = app.packageName;
        ref.read(blockedAppNotifierProvider.notifier).addBlockedApp(newBlockedApp);
      } else {
        ref.read(blockedAppNotifierProvider.notifier).removeBlockedAppsByPackageName(app.packageName);
      }
    });
  }
}