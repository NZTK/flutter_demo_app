import 'package:flutter/gestures.dart';
import 'package:flutter_demo_app/util/important.dart';

class ListenerDemo extends StatefulWidget {
  const ListenerDemo({Key? key}) : super(key: key);

  @override
  _ListenerDemoState createState() => _ListenerDemoState();
}

class _ListenerDemoState extends State<ListenerDemo> {
  bool flg = true;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listener')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: flg ? null : NeverScrollableScrollPhysics(),
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
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              flg = !flg;
                            });
                          }, 
                          child: Text('scroll able Flag ${flg}')
                        ),
                        ListenerDemoContainer(),
                        MarkdownBody(
                          selectable: true,
                          builders: {
                            'pre' : CustomPreBuilder(),
                          },
                          data: '''

  ``` dart
  class ListenerDemoContainer extends StatefulWidget {
    const ListenerDemoContainer({Key? key}) : super(key: key);

    @override
    _ListenerDemoContainerState createState() => _ListenerDemoContainerState();
  }

  class _ListenerDemoContainerState extends State<ListenerDemoContainer> {

    double _scale =  1.0;
    int _count = 0;
    String _signal = 'no Signal';
    String _text = 'no event';
    Color _color = Colors.red;
    double _sizeW = 100;
    double _sizeH = 100;

    bool _sizeOrScale = false;

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                _sizeOrScale = !_sizeOrScale;
              });
            },
            child: _sizeOrScale ? Text('scale'): Text('size'),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 100.h),
            child: Listener(
              child: Container(
                child: Transform.scale(
                  scale: _scale,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 100.h),
                    width: _sizeW,
                    height: _sizeH,
                    color: _color,
                    child: Text(_text),
                  ),
                ),
              ),
              onPointerSignal: (pointerSignal) {
                if(pointerSignal is PointerScrollEvent){
                  setState(() {
                    _count = 0;
                    if(_sizeOrScale){
                      if(pointerSignal.scrollDelta.dy > 0){
                        if(_scale > 0.5) _scale -= 0.1;
                      }else{
                        if(_scale < 2.5) _scale += 0.1;
                      }
                      _text = _scale.toString();
                    }else{
                      if(pointerSignal.scrollDelta.dy > 0){
                        if(_sizeH > 50) _sizeH -= 1;
                      }else{
                        if(_sizeH < 200) _sizeH += 1;
                      }
                      if(pointerSignal.scrollDelta.dx > 0){
                        if(_sizeW > 50) _sizeW -= 1;
                      }else{
                        if(_sizeW < 200) _sizeW += 1;
                      }
                      _text = 'hight '+_sizeH.toString() + ' width ' + _sizeW.toString();
                    }
                    _signal = 'PointerScrollEvent';
                  });
                }
              },
              onPointerHover: (pointerHover) {
                setState(() {
                  _count++;
                  _text = _count.toString();
                  _signal = 'PointerHoverEvent';
                });
              },
              onPointerDown: (pointerDown){
                _count = 0;
                setState(() {
                    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                    _text = 'change color';
                    _signal = 'PointerDownEvent';
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.h),
            child: Text('onPointerSignal \${_signal}',
              style: TextStyle(fontSize: 0.02.sh),
            )
          ),
        ],
      );
    }
  }
  ```

                  '''
                        ),
                      ],
                    ),
                  ),
                  openWebText(text: "公式ドキュメント", url: "https://api.flutter.dev/flutter/widgets/Listener-class.html"),
                ],
              )
            )
          ),
        )
      ),
    );
  }
}

class ListenerDemoContainer extends StatefulWidget {
  const ListenerDemoContainer({Key? key}) : super(key: key);

  @override
  _ListenerDemoContainerState createState() => _ListenerDemoContainerState();
}

class _ListenerDemoContainerState extends State<ListenerDemoContainer> {

  double _scale =  1.0;
  int _count = 0;
  String _signal = 'no Signal';
  String _text = 'no event';
  Color _color = Colors.red;
  double _sizeW = 100;
  double _sizeH = 100;

  bool _sizeOrScale = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              _sizeOrScale = !_sizeOrScale;
            });
          },
          child: _sizeOrScale ? Text('scale'): Text('size'),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 100.h),
          child: Listener(
            child: Container(
              child: Transform.scale(
                scale: _scale,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 100.h),
                  width: _sizeW,
                  height: _sizeH,
                  color: _color,
                  child: Text(_text),
                ),
              ),
            ),
            onPointerSignal: (pointerSignal) {
              if(pointerSignal is PointerScrollEvent){
                setState(() {
                  _count = 0;
                  if(_sizeOrScale){
                    if(pointerSignal.scrollDelta.dy > 0){
                      if(_scale > 0.5) _scale -= 0.1;
                    }else{
                      if(_scale < 2.5) _scale += 0.1;
                    }
                    _text = _scale.toString();
                  }else{
                    if(pointerSignal.scrollDelta.dy > 0){
                      if(_sizeH > 50) _sizeH -= 1;
                    }else{
                      if(_sizeH < 200) _sizeH += 1;
                    }
                    if(pointerSignal.scrollDelta.dx > 0){
                      if(_sizeW > 50) _sizeW -= 1;
                    }else{
                      if(_sizeW < 200) _sizeW += 1;
                    }
                    _text = 'hight '+_sizeH.toString() + ' width ' + _sizeW.toString();
                  }
                  _signal = 'PointerScrollEvent';
                });
              }
            },
            onPointerHover: (pointerHover) {
              setState(() {
                _count++;
                _text = _count.toString();
                _signal = 'PointerHoverEvent';
              });
            },
            onPointerDown: (pointerDown){
              _count = 0;
              setState(() {
                  _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                  _text = 'change color';
                  _signal = 'PointerDownEvent';
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 50.h),
          child: Text('onPointerSignal ${_signal}',
            style: TextStyle(fontSize: 0.02.sh),
          )
        ),
      ],
    );
  }
}