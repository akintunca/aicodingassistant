import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';
import 'api_request.dart';
import 'api_response.dart';

class ApiConnection {
  final String prompt;

  ApiConnection({required this.prompt});

  /// Gets a "improved text" from the OpenAI completions endpoint
  Future<ApiResponse> getText() async {
    // The completions endpoint
    final Uri apiEndpoint = Uri.parse('https://api.openai.com/v1/chat/completions');

    // The headers for the completions endpoint, which are the same for all requests
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    debugPrint('Getting the data');

    ApiRequest request = ApiRequest(
      model: 'gpt-3.5-turbo',
      prompt: prompt
    );

    http.Response response =
        await http.post(apiEndpoint, headers: headers, body: request.toJson());
    //debugPrint('Received OpenAI API response: ${response.body}');

    // Check to see if there was an error
    if (response.statusCode != 200) {
      //debugPrint('Failed to get a text with status code, ${response.statusCode}');
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load text');
      // If the server did return a 200 OK response,
      // then parse the JSON.
    }
    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    return apiResponse;
  }
}
