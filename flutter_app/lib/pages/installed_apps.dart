import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import 'package:flutter_app/ui_components/app_bar.dart'; 

class InstalledAppsPage extends StatefulWidget {
  const InstalledAppsPage({Key? key}) : super(key: key);

  @override
  _InstalledAppsState createState() => _InstalledAppsState();
}

class _InstalledAppsState extends State<InstalledAppsPage> {
  List<AppInfo> _apps = []; // State variable to store list of apps
  List<AppInfo> _filteredApps = []; // Filtered list based on search
  bool _isLoading = true; // State to show a loading indicator
  String _searchQuery = ''; // Current search query

  @override
  void initState() {
    super.initState();
    _fetchInstalledApps();
  }

  // Fetch the installed apps
  Future<void> _fetchInstalledApps() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(
      false, // Include system apps if needed
      true, // Get app icons if needed
      "", // Filter by package name if needed
    );

    // Update the state with the fetched apps
    setState(() {
      _apps = apps;
      _filteredApps = apps; // Initialize filtered list
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
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner
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

                        return ListTile(
                          leading: Image.memory(
                            app.icon!,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(app.name),
                          subtitle: Text(app.packageName),
                          onTap: () {
                            // Action when the app is tapped
                            print('Tapped on ${app.name}');
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
}