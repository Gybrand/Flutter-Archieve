/* import 'package:flutter/material.dart';
import 'package:flutter_archieve/Dropdown%20Global%20State%20Provider/page/settings_page.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<String> _items = ['TugasAkhir', 'Item 1', 'Item 2', 'Item 3'];
  String? _selectedItem = "TugasAkhir"; // Store the selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue; // Update the selected item
                  });
                },
                items: _items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
                    _editItem(_selectedItem);
                  } else if (value == 'delete') {
                    _deleteItem(_selectedItem);
                  }
                },
              ),
              //BUTTON
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorldPage(),
                    ),
                  );
                },
                child: const Text('Change Page'),
              ),
            ],
          ),
        ])));
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

  void _editItem(String? item) {
    if (item != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          //String? updatedItem = item;
          TextEditingController _controller = TextEditingController(text: item);

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
                      int index = _items.indexOf(item);
                      if (index != -1) {
                        _items[index] = updatedValue;
                        _selectedItem = updatedValue; // Update _selectedItem
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
  }

  void _deleteItem(String? item) {
    if (item != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete Item'),
            content: Text('Are you sure you want to delete "$item"?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    _items.remove(item);
                    _selectedItem = null; // Reset selection
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
}
 */