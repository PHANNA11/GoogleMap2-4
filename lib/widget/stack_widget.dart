import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
      ),
      body: Center(
        child: Stack(children: const [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/eQFJdg.png'),
            ),
          ),
          Positioned(
            child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image(image: AssetImage('assets/mr.dash.png'))),
          )
        ]),
      ),
    );
  }
}
