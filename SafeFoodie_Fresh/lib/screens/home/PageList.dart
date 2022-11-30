import 'package:flutter/material.dart';

void main() {
  runApp(const PageList());
}

class PageList extends StatefulWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  State<PageList> createState() => _PageList();
}

class _PageList extends State<PageList> {
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Grocery List"),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                onSubmitted:
                (text) {
                  litems.add(text);
                  eCtrl.clear();
                  setState(() {});
                };
              },
            ),
            new Expanded(
                child: new ListView.builder(
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new Text(litems[Index]);
                    }))
          ],
        ));
  }
}
