import 'package:flutter/material.dart';
import 'package:flutter_demo_app/util/important.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(2560,1600),
      builder: () => MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/widget': (context)  => WidgetListPage(),
        '/container': (context)  => ContainerDemo(),
        '/text': (context)  => TextDemo(),
        '/class': (context)  => ClassListPage(),
        '/future': (context)  => FutureDemo(),
        '/listener': (context)  => ListenerDemo(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List> _pageList;
  @override
  void initState() {
    _pageList = getPageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: FutureBuilder(
          future: _pageList,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if(snapshot.hasData){
              return PageList(pageList: snapshot.data);
            } else if(snapshot.hasError) {
              return Text("データが存在しません");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
