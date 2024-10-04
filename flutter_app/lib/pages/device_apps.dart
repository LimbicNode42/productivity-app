import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

import 'package:flutter_app/ui_components/app_bar.dart';

class InstalledAppsPage extends StatefulWidget {
  @override
  _InstalledAppsPageState createState() => _InstalledAppsPageState();
}

class _InstalledAppsPageState extends State<InstalledAppsPage> {
  List<Application> installedApps = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getInstalledApps();
  }

  // Get the list of installed apps
  Future<void> _getInstalledApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeSystemApps: false, // Whether to include system apps
      onlyAppsWithLaunchIntent: true, // Only include apps that can be launched
    );

    setState(() {
      installedApps = apps;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: installedApps.length,
              itemBuilder: (context, index) {
                Application app = installedApps[index];
                return ListTile(
                  leading: app is ApplicationWithIcon
                      ? Image.memory(app.icon, width: 48, height: 48)
                      : Icon(Icons.android),
                  title: Text(app.appName),
                  subtitle: Text(app.packageName),
                  onTap: () {
                    // Launch the app when tapped
                    DeviceApps.openApp(app.packageName);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: Icon(Icons.add),
      ),
    );
  }
}