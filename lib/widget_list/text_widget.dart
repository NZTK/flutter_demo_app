import 'package:flutter_demo_app/util/important.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super (key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment:  Alignment.topCenter,
            child: Container(

            ),
          ),
        )
      ),
    );
  }
}