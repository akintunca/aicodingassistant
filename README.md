# AIcodingassistant

AIcodingassistant is an open-source Flutter application that uses OpenAI's ChatGPT 3.5-turbo model to help coders. The app is designed as a web app but can be easily edited to be a mobile or desktop app. It has a sleek one-page design with smooth animations and a constantly moving gradient color background.

## Features

The AIcodingassistant app has the following features:

- AI coding assistance using OpenAI's ChatGPT 3.5-turbo model
- Dark/Light mode changing button in the top right corner
- Smooth transition animations
- Background with non-stop moving gradient colors

## Usage

When the app is opened, it will display a single page with an input box in the middle of the screen. Users can enter code snippets or questions related to coding in this box. In the top right corner of the page, there is a button to switch between dark and light mode.

At the bottom center of the page, there is a button labeled "AI." When this button is clicked, it will change its label to "X" and send a request to the API to obtain assistance for the entered code or question. Once the request is sent, the input box will be replaced by an output box displaying the AI's response.

    1 - Clone this repository using the command `git clone https://github.com/akintunca/aicodingassistant`
    2 - Move into the cloned repository using `cd aicodingassistant`
    3 - Install the required packages using `flutter pub get`
    4 - Add your own OpenAI APIkey to the following file `...\lib\gpt-3.5-turbo\api_key.dart`
    5 - Run the app using `flutter run`

## Technology Stack

The AIcodingassistant app uses the following technologies:

- Flutter framework
- OpenAI's ChatGPT 3.5-turbo model API
- GetX package for state management
- Http package for making HTTP requests
- Shared_preference package for storing user preferences
- Shimmer package for loading animations
- url_launcher package for redirecting to a link

## Screenshots

![screenshot1](https://github.com/akintunca/aicodingassistant/blob/master/preview/screenshot1.png)

![screenshot2](https://github.com/akintunca/aicodingassistant/blob/master/preview/screenshot2.png)

![screenshot3](https://github.com/akintunca/aicodingassistant/blob/master/preview/screenshot3.png)

![screenshot4](https://github.com/akintunca/aicodingassistant/blob/master/preview/screenshot4.png)

## Demo Video

[![AIcodingassistant](https://i9.ytimg.com/vi_webp/0CvcN3GK2N8/mq2.webp?sqp=CMTuy6EG-oaymwEmCMACELQB8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGHIgRShnMA8=&rs=AOn4CLCbUhsb7WD3DkJ-bGRwXVXnOCYPDA)](https://youtu.be/0CvcN3GK2N8 "AIcodingassistant")

## Contributing

Contributions are always welcome! If you have any suggestions or find a bug, please submit an issue or pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.