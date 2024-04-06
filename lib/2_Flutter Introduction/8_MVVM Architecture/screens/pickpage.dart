import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickPage extends StatefulWidget {
  const PickPage({super.key});

  @override
  State<PickPage> createState() => _PickPageState();
}

class _PickPageState extends State<PickPage> {
  //Date Time Picker
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  //Color Picker
  Color _currentColor = Colors.purple;

  //File Picker
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pick Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date'),
                TextButton(
                  child: const Text('Select'),
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(currentDate.year + 5));
                    setState(
                      () {
                        if (selectDate != null) {
                          _dueDate = selectDate;
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
            const SizedBox(height: 20),

            //Color Picker
            const Text('Color'),
            const SizedBox(height: 10),
            Container(
              height: 100,
              width: double.infinity,
              color: _currentColor,
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_currentColor),
                ),
                child: const Text(
                  'Pick Color',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick Your Color'),
                          content: BlockPicker(
                            pickerColor: _currentColor,
                            onColorChanged: (color) {
                              setState(() {
                                _currentColor = color;
                              });
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            const SizedBox(height: 20),

            //File Picker
            Center(
              child: Column(
                children: [
                  const Text('Pick Files'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Pick and Open File'),
                    onPressed: () {
                      _pickFile();
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 50),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
