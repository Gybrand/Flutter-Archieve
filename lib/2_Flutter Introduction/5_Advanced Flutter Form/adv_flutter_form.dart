import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class AdvFlutterForm extends StatefulWidget {
  const AdvFlutterForm({super.key});

  @override
  State<AdvFlutterForm> createState() => _AdvFlutterFormState();
}

class _AdvFlutterFormState extends State<AdvFlutterForm> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

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
        title: const Text('Interactive Widgets'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
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
                    child: const Text('Pick Color'),
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
                const Text('Pick Files'),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    child: const Text('Pick and Open File'),
                    onPressed: () {
                      _pickFile();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
