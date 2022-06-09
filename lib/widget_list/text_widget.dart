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
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 200.w),
              margin: EdgeInsets.only(bottom: 100.h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 100.h),
                    child: Text(
                      'Text',
                      style: TextStyle(
                        fontSize: 0.05.sh,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  MarkdownBody(
                    selectable: true,
                    builders: {
                      'pre' : CustomPreBuilder(),
                    },
                    data: '''

``` dart
Text(
  'Text',
  style: TextStyle(
    fontSize: 0.05.sh,
    fontWeight: FontWeight.bold),
),
```

      '''
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 100.h),
                  child: MoveText1(),
                  ),
                  openWebText(text: "公式ドキュメント", url: "https://api-flutter-dev.translate.goog/flutter/widgets/Text-class.html?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=sc"),
                ],
              )
            )
          ),
        )
      ),
    );
  }
}

class MoveText1 extends StatefulWidget {
  @override
  _MoveText1State createState() => _MoveText1State();
}

class _MoveText1State extends State<MoveText1> {
  double size = 50.0;

  void _changeSize(double e) => setState(() {size = e;});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.4.sh,
          alignment: Alignment.center,
          child: Wrap(
            children:[ 
              Text(
                'Text',
                style: TextStyle(
                  fontSize: size,
                ),
            ),
            ]
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 50.h),
                child: Text('サイズ ${size}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children :[
                  Text('size'),
                  Slider(
                    label: 'size',
                    value: size,
                    onChanged: _changeSize,
                    min: 0,
                    max: 200,
                  ),
                ]
              ),
            ],
          )  ,
        ),
      ],
    );
  }
}