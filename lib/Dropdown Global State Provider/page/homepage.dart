import 'package:flutter/material.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/page/settings_page.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DropdownPage extends StatefulWidget {
  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  List<String> _items = ['TugasAkhir'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<DatabaseProvider>(
                  builder: (context, userProvider, _) {
                    return DropdownButton<String>(
                      value: userProvider.dbSelect,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          userProvider.changeDB(newDbSelect: newValue);
                        }
                      },
                      items:
                          _items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'add',
                      child: Text('Add'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  onSelected: (String value) {
                    if (value == 'add') {
                      _addItem();
                    } else if (value == 'edit') {
                      _editItem();
                    } else if (value == 'delete') {
                      _deleteItem();
                    }
                  },
                ),
              ],
            ),
            Consumer<DatabaseProvider>(
              builder: (context, userProvider, _) {
                return Text(
                  userProvider.dbSelect,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorldPage(),
                      ));
                },
                child: const Text('Change Page')),
          ],
        ),
      ),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newItem = '';
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
            decoration: InputDecoration(hintText: 'Enter item name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _items.add(newItem);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? updatedItem = _items.first;
        TextEditingController _controller =
            TextEditingController(text: _items.first);

        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter new name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String updatedValue = _controller.text.trim();
                if (updatedValue.isNotEmpty) {
                  setState(() {
                    int index = _items.indexOf(updatedItem);
                    if (index != -1) {
                      _items[index] = updatedValue;
                    }
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete "${_items.first}"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _items.remove(_items.first);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
