import 'package:flutter_demo_app/util/important.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 200.w),
              margin: EdgeInsets.only(bottom: 100.h),
              child: Column(
                children: [
                  Container(
                    width: 0.4.sh,
                    margin: EdgeInsets.only(top: 100.h),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child : AspectRatio(
                        aspectRatio: 1,
                      child: Container(
                        color: Colors.red,
                      )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "基本設定\nheight:100\nwidth:100\ncolor:red\n",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MarkdownBody(
                    selectable: true,
                    builders: {
                      'pre' : CustomPreBuilder(),
                    },
                    data: '''

``` dart
Container(
  width: 100.sh,
  height: 100.sh,
  color: Colors.red,
)
```

      '''
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: MoveContainer()
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 100.h),
                    child: MarkdownBody(
                      selectable: true,
                      builders: {
                        'pre' : CustomPreBuilder(),
                      },
                      data: '''

  ``` dart
  Container Container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip clipBehavior = Clip.none,
  })
  ```

                  '''
                    ),
                  ),
                  openWebText(text: "公式ドキュメント", url: "https://flutter.ctrnost.com/basic/layout/container/")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MoveContainer extends StatefulWidget {
  @override
  _MoveContainerState createState() => _MoveContainerState(); 
}

class _MoveContainerState extends State<MoveContainer> {
  double marginTop = 0;
  double marginBotton = 0;
  double marginLeft = 0;
  double marginRight = 0;

  double paddingTop = 0;
  double paddingBotton = 0;
  double paddingLeft = 0;
  double paddingRight = 0;

  double height = 0;
  double width = 0;

  double colorR = 0;
  double colorG = 0;
  double colorB = 0;
  double colorO = 1;

  void _changeMarginTop(double e) => setState(() {marginTop = e;});
  void _changeMarginBotton(double e) => setState(() {marginBotton = e;});
  void _changeMarginLeft(double e) => setState(() {marginLeft = e;});
  void _changeMarginRight(double e) => setState(() {marginRight = e;});

  void _changePaddingTop(double e) => setState(() {paddingTop = e;});
  void _changePaddingBotton(double e) => setState(() {paddingBotton = e;});
  void _changePaddingLeft(double e) => setState(() {paddingLeft = e;});
  void _changePaddingRight(double e) => setState(() {paddingRight = e;});

  void _changeColorR(double e) => setState(() {colorR = e;});
  void _changeColorG(double e) => setState(() {colorG = e;});
  void _changeColorB(double e) => setState(() {colorB = e;});
  void _changeColorO(double e) => setState(() {colorO = e;});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 100.h),
          alignment: Alignment.centerLeft,
          child: Text(
            '・Margin Padding Color',
            style: TextStyle(fontSize: 0.05.sh, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 0.4.sh,
          child: Align(
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.red,
                child: Container(
                  height: 0.4.sh,
                  width: 0.4.sw,
                  margin:EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBotton),
                  padding: EdgeInsets.fromLTRB(paddingLeft, paddingTop, paddingRight, paddingBotton),
                  color: Color.fromRGBO(colorR.toInt(), colorG.toInt(), colorB.toInt(), colorO),
                  child: Container(
                    color: Colors.amber,
                    height: 0.15.sh,
                    width: 0.15.sw,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          "設定\nmargin:EdgeInsets.fromLTRB(${marginLeft}, ${marginTop}, ${marginRight}, ${marginBotton}),\nColor.fromRGBO(${colorR}, ${colorG}, ${colorB}, ${colorO})\npadding:EdgeInsets.fromLTRB(${paddingLeft}, ${paddingTop}, ${paddingRight}, ${paddingBotton})\n",
          textAlign: TextAlign.center,
        ),
        Wrap(
          children :[
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('marginT'),
                  Slider(
                    label: 'marginTop',
                    value: marginTop,
                    onChanged: _changeMarginTop,
                    min: 0,
                    max: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('marginB'),
                  Slider(
                    label: 'marginBotton',
                    value: marginBotton,
                    onChanged: _changeMarginBotton,
                    min: 0,
                    max: 50,
                  )
                ],
              ),
            )
          ]
        ),
        Wrap(
          children :[
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('marginL'),
                  Slider(
                    label: 'marginLeft',
                    value: marginLeft,
                    onChanged: _changeMarginLeft,
                    min: 0,
                    max: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('marginR'),
                  Slider(
                    label: 'marginRight',
                    value: marginRight,
                    onChanged: _changeMarginRight,
                    min: 0,
                    max: 50,
                  )
                ],
              ),
            )
          ]
        ),
        Wrap(
          children :[
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('paddingT'),
                  Slider(
                    label: 'paddingTop',
                    value: paddingTop,
                    onChanged: _changePaddingTop,
                    min: 0,
                    max: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('paddingB'),
                  Slider(
                    label: 'paddingBotton',
                    value: paddingBotton,
                    onChanged: _changePaddingBotton,
                    min: 0,
                    max: 50,
                  )
                ],
              ),
            )
          ]
        ),
        Wrap(
          children :[
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('paddingL'),
                  Slider(
                    label: 'paddingLeft',
                    value: paddingLeft,
                    onChanged: _changePaddingLeft,
                    min: 0,
                    max: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('paddingR'),
                  Slider(
                    label: 'paddingRight',
                    value: paddingRight,
                    onChanged: _changePaddingRight,
                    min: 0,
                    max: 50,
                  )
                ],
              ),
            )
          ]
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children :[
            Text('R'),
            Slider(
              label: 'colorRed',
              value: colorR,
              onChanged: _changeColorR,
              min: 0,
              max: 255,
            ),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children :[
            Text('G'),
            Slider(
              label: 'colorGreen',
              value: colorG,
              onChanged: _changeColorG,
              min: 0,
              max: 255,
            ),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children :[
            Text('B'),
            Slider(
              label: 'colorBlue',
              value: colorB,
              onChanged: _changeColorB,
              min: 0,
              max: 255,
            ),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children :[
            Text('O'),
            Slider(
              label: 'colorO',
              value: colorO,
              onChanged: _changeColorO,
              min: 0,
              max: 1,
            ),
          ]
        ),
      ],
    );
  }
}
