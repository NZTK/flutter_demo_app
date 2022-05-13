import 'package:flutter_demo_app/util/important.dart';

class ClassListPage extends StatefulWidget {
  const ClassListPage({Key? key}) : super(key: key);

  @override
  State<ClassListPage> createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
  late Future<List> _pageList;
  @override
  void initState() {
    _pageList = getItemList('class');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('classList'),
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
