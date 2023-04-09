import 'package:flutter/material.dart';

import '../gpt-3.5-turbo/api_connection.dart';
import '../gpt-3.5-turbo/api_response.dart';
import 'copy_button.dart';
import 'shimmer_effect.dart';

class MyCustomOutputBox extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback?
      repeatFunction; //or final Void Function()? repeatFunction;
  final bool clicked;

  const MyCustomOutputBox(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      this.repeatFunction,
      required this.clicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(75),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          height: height,
          width: width,
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1500),
          onEnd: repeatFunction,
          child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: clicked
                  ? FutureBuilder<ApiResponse>(
                      future: ApiConnection(prompt: text).getText(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Form(
                              child: TextFormField(
                            readOnly: true,
                            initialValue: snapshot.data!.result.toString(),
                            minLines: 50,
                            maxLines: 50,
                            decoration: InputDecoration(
                                suffix: CopyButton(
                                    data: snapshot.data!.result.toString())),
                          ));
                        } else if (snapshot.hasError) {
                          return Text(
                              snapshot.error.toString()); // ${snapshot.error}
                        }
                        return const ShimmerEffect();
                      },
                    )
                  : null),
        ),
      ),
    );
  }
}
