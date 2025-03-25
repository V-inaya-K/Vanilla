import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  static const String apiUrl = "https://libretranslate.com/translate";

  static Future<String> translate(String text, String targetLang) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "q": text,
        "source": "auto",
        "target": targetLang,
        "format": "text"
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["translatedText"];
    } else {
      throw Exception("Failed to translate");
    }
  }
}
