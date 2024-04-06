import 'package:flutter/material.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Page'),
      ),
      body: Center(
        child: Text(
          context.watch<DatabaseProvider>().dbSelect,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
