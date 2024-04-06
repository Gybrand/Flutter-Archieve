import "package:flutter/material.dart";

class FlutterLayoutPage extends StatelessWidget {
  const FlutterLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MaterialApp"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('this is material App'),
      ) /* ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text('Username $index'),
            subtitle: Text('Email $index'),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ),
      ), */
      ,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
