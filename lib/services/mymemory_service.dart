import 'dart:convert';
import 'package:http/http.dart' as http;
class MyMemory {
  static String selectedOption = 'Option 1';

  static void setSelectedOption(String newOption) {
    selectedOption = newOption;
  }
}

// -------------------------------
// class MyMemory {
//   static const String apiUrl = "https://api.mymemory.translated.net/get";
//
//   static Future<String> translateText(String text, String sourceLang, String targetLang) async {
//     final Uri url = Uri.parse("$apiUrl?q=$text&langpair=$sourceLang|$targetLang");
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data["responseData"]["translatedText"];
//     } else {
//       throw Exception("Translation failed");
//     }
//   }
// }
