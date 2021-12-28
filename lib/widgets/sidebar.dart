import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key, required this.title, required this.body})
      : super(key: key);
  final String title;
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Options',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('About app'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("About app"),
                      content: Text(
                          "This app is only in alpha phase.\n\nCreators:\nKis-Gáll Dávid (CEO)\nIosif Bacau\nLe Viego (leTroll)"),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Help"),
                      content: Text(
                          "For help contact our support:\nE-mail:\tkisgalldavid71@gmail.com\nMobile number:\t0740504425"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
