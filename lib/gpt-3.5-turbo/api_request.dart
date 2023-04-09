/* curl https://api.openai.com/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer YOUR_API_KEY' \
  -d '{
  "model": "gpt-3.5-turbo",
  "messages": [{"role": "user", "content": "Hello!"}]
}' */

import 'dart:convert';

/// Represents the parameters used in the body of a request to the OpenAI completions endpoint.
class ApiRequest {
  final String model;
  final String prompt;
  final double? temperature;
  final int? maxTokens;
  final double? topP;
  final double? frequencyPenalty;
  final double? presencePenalty;

  ApiRequest({
    required this.model,
    required this.prompt,
    this.maxTokens,
    this.temperature,
    this.topP,
    this.frequencyPenalty,
    this.presencePenalty,
  });

  String toJson() {
    Map<String, dynamic> jsonBody = {
      'model': model,
      'messages': [
        {"role": "system", "content": "You are an software language assistant that helps me code."},
        {"role": "user", "content": prompt}
      ],
    };

    if (temperature != null) {
      jsonBody.addAll({'max_tokens': maxTokens});
    }

    if (temperature != null) {
      jsonBody.addAll({'temperature': temperature});
    }

    if (topP != null) {
      jsonBody.addAll({'top_p': topP});
    }

    if (frequencyPenalty != null) {
      jsonBody.addAll({'frequency_penalty': frequencyPenalty});
    }

    if (presencePenalty != null) {
      jsonBody.addAll({'presence_penalty': presencePenalty});
    }

    return json.encode(jsonBody);
  }
}
