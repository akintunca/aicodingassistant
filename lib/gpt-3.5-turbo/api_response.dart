/* {
  "id": "chatcmpl-123",
  "object": "chat.completion",
  "created": 1677652288,
  "choices": [{
    "index": 0,
    "message": {
      "role": "assistant",
      "content": "\n\nHello there, how may I assist you today?",
    },
    "finish_reason": "stop"
  }],
  "usage": {
    "prompt_tokens": 9,
    "completion_tokens": 12,
    "total_tokens": 21
  }
}
 */

import 'dart:convert';

import 'package:http/http.dart';

class ApiResponse {
  final Map<String, dynamic> responseBody;
  final String? id;
  final String object;
  final int? created;
  final List<dynamic>? choices; // This list contains the completions
  final Map<String, dynamic>? usage;
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;
  final String? result;

  const ApiResponse({
    required this.responseBody,
    required this.id,
    required this.object,
    required this.created,
    required this.choices,
    required this.usage,
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    required this.result,
  });

  /// Returns a [ApiResponse] from the JSON obtained from the completions endpoint.
  factory ApiResponse.fromResponse(Response response) {
    // Get the response body in JSON format
    Map<String, dynamic> responseBody = json.decode(utf8.decode(response.bodyBytes));

    // Parse out information from the response
    Map<String, dynamic> usage = responseBody['usage'];

    // Parse out the choices
    List<dynamic> choices = responseBody['choices'];

    // Get the text of the first completion
    String result = choices[0]['message']['content'];

    return ApiResponse(
      responseBody: responseBody,
      id: responseBody['id'],
      object: responseBody['object'],
      created: responseBody['title'],
      choices: choices,
      usage: usage,
      promptTokens: usage['prompt_tokens'],
      completionTokens: usage['completion_tokens'],
      totalTokens: usage['total_tokens'],
      result: result,
    );
  }
}
