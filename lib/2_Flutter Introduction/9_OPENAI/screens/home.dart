import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/screens/result.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/services/recommendation_phone.dart';

const List<String> phoneCapacity = <String>[
  '32 GB',
  '64 GB',
  '128 GB',
];

const List<String> camera = <String>[
  '8 MP',
  '12 MP',
  '18 MP',
  '24 MP',
  '36 MP',
  '40 MP',
];

class OpenAIScreen extends StatefulWidget {
  const OpenAIScreen({super.key});

  @override
  State<OpenAIScreen> createState() => _OpenAIScreenState();
}

class _OpenAIScreenState extends State<OpenAIScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerHarga = TextEditingController();
  String phoneCapacityValue = phoneCapacity.first;
  String cameraValue = camera.first;
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });
    try {
      final result = await RecommendationService.getRecommendations(
        phoneCapacity: phoneCapacityValue,
        camera: cameraValue,
        harga: _controllerHarga.value.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Something went wrong'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Phone Recommendation'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                heightFactor: 4,
                child: Text(
                  "Phone Recommendation by AI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Choose internal Capacity",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: DropdownButton<String>(
                  value: phoneCapacityValue,
                  icon: Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.teal),
                  underline: Container(
                    height: 2,
                    color: Colors.tealAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      phoneCapacityValue = value!;
                    });
                  },
                  items: phoneCapacity
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Choose Camera Mega Pixel",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: DropdownButton<String>(
                  value: cameraValue,
                  icon: Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.teal),
                  underline: Container(
                    height: 2,
                    color: Colors.tealAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      cameraValue = value!;
                    });
                  },
                  items: camera.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Please enter your budget in IDR",
                ),
              ),

              //Budget
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controllerHarga,
                  decoration: InputDecoration(
                    hintText: "Enter a budget (in IDR)",
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null;
                    if (isInvalid) {
                      return 'Please enter a valid budget';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: Center(
                          child: Text(
                            "Get Recommendations",
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
