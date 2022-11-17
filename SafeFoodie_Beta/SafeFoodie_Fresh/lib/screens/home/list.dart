import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Gorcery Lists',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color.fromARGB(166, 72, 168, 75),
        primaryColor: Color.fromARGB(166, 72, 168, 75), //color of background
        textTheme: Typography().black, //sets default text to black
      ),
      home: ListPage(),
    ),
  );
}

class ListPage extends StatefulWidget {
  final Function? toggleView;
  ListPage({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final List<String> food = <String>[];
  final List<DateUtils> date = <DateUtils>[];
  TextEditingController nameController = TextEditingController();
  bool isChecked = false;

  void addItemToList() {
    setState(() {
      food.insert(0, nameController.text);
    });

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Grocery List'),
          ),
          body: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Item',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                addItemToList();
              },
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: food.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        margin: EdgeInsets.all(2),
                        child: Center(
                            child: Text(
                          '${food[index]} (${date[index]})',
                          style: TextStyle(fontSize: 18),
                        )),
                      );
                    }))
          ]));
      Color getColor(Set<MaterialState> states) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
        };
        if (states.any(interactiveStates.contains)) {
          return Colors.blue;
        }
        return Colors.red;
      }
      return Checkbox(checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value){
        setState((){
          isChecked = value!;
        });
      },
    };
  }
}
