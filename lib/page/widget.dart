import 'package:flutter_demo_app/util/important.dart';

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({Key? key}) : super(key: key);

  @override
  State<WidgetListPage> createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  late Future<List> _pageList;
  @override
  void initState() {
    _pageList = getItemList('widget');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widgetList'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: FutureBuilder(
          future: _pageList,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if(snapshot.hasData){
              return PageList(pageList: snapshot.data);
            } else {
              return Text("データが存在しません");
            }
          },
        ),
      ),
    );
  }
}
