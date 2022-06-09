 import 'important.dart';
 
Future<List> getPageList() async {
  var getJson = await rootBundle.loadString('json/widget_list.json');
  return jsonDecode('[' + getJson + ']');
}

Future<List> getItemList(String? item) async {
  var getJson = await rootBundle.loadString('json/widget_list.json');
  List list = jsonDecode(getJson);
  return list.where((element) => element['name'] == item).toList();
}

class PageList extends StatelessWidget {

  final List? pageList;
  PageList({@required this.pageList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: (pageList![0] is List<dynamic>) ? pageList![0].length : pageList![0]['contains'].length,
      itemBuilder: (context, index) {
        var list = (pageList![0] is List) ?  pageList![0][index] : pageList![0]['contains'][index]; 
        return Card(
          child: ListTile(
            leading: Icon((pageList![0] is List) ? IconData(int.parse(pageList![0][index]['icon']), fontFamily: 'MaterialIcons') : Icons.abc),
            tileColor: Color.fromRGBO(index, index, index, 0.1),
            title: Text(list!['name'].toString()),
            onTap: () => Navigator.of(context).pushNamed("/"+list!['route']),
          ),
        );
      }
    );
  }
}

class Pre extends StatelessWidget {
  final String text;
  const Pre({Key? key, required this.text});

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: Colors.black),
              child: Padding(
              padding:  EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: SelectableText(
                text,
                style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
              ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class CustomPreBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(text, TextStyle? preferredStyle) {
    return  Pre(text: text.text);
  }
}

class openWebText extends StatelessWidget {
  const openWebText({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);
  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 200.w),
        child:  InkWell(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold 
            ),
          ),
          onTap: () => launch(url),
        ),
      ),
    );
  }
}

