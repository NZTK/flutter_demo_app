import 'package:flutter_demo_app/util/important.dart';

class FutureDemo extends StatelessWidget {
  const FutureDemo({Key? key}) : super (key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment:  Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 200.w),
              margin: EdgeInsets.symmetric(vertical: 100.h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 100.h),
                    child: Column(
                      children: [
                        changeColor(),
                        MarkdownBody(
                          selectable: true,
                          builders: {
                            'pre' : CustomPreBuilder(),
                          },
                          data: '''

      ``` dart
      class changeColor extends StatefulWidget{
        @override
        _changeColorState createState() => _changeColorState(); 
      }

      class _changeColorState extends State<changeColor> {
        bool press = true;
        @override
        Widget build(BuildContext context){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 100.h),
            child: Column(
              children: [
                Text(
                  "色変わるTEXT",
                  style: TextStyle(
                    color: press ? Colors.red : Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      print('color');
                      press = !press;
                      print(press);
                    });
                  },
                  child: Text('押したら色が変わるボタン')
                ),
              ]
            ),
          );
        }
      }
      ```

                                '''
                        ),
                      ],
                    ),
                  ),
                  openWebText(text: "公式ドキュメント", url: "https://api-flutter-dev.translate.goog/flutter/dart-async/Future-class.html?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=sc"),
                ],
              )
            )
          ),
        )
      ),
    );
  }
}

class changeColor extends StatefulWidget{
  @override
  _changeColorState createState() => _changeColorState(); 
}

class _changeColorState extends State<changeColor> {
  bool press = true;
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 100.h),
      child: Column(
        children: [
          Text(
            "色変わるTEXT",
            style: TextStyle(
              color: press ? Colors.red : Colors.blue,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                print('color');
                press = !press;
                print(press);
              });
            },
            child: Text('押したら色が変わるボタン')
          ),
        ]
      ),
    );
  }
}
