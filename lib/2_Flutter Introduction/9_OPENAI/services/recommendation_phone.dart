import 'dart:convert';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/constants/open_ai.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/9_OPENAI/models/open_ai_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String harga,
    required String camera,
    required String phoneCapacity,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );
    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=utf-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: '',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(harga));

      String promptData =
          "Berikan lima rekomendasi HP dengan modal uang $phoneBudget rupiah dan kamera ${camera.toLowerCase()} serta kapasitas internal storage sebesar ${phoneCapacity.toLowerCase()}";
      //"You are a phone expert. Please give me a 5 phone recommendation from internal storages ${phoneCapacity.toLowerCase()} manufacturers with budget equals to $phoneBudget rupiah and camera $camera";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 1,
        "max_tokens": 1000,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request');
    }
    return gptData;
  }
}
