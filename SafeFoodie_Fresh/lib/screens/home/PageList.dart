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
  final List<String> food = <String>['apple'];
  final List<int> date = <int>[2];
  TextEditingController nameController = TextEditingController();
  bool isChecked = false;

  void addItemToList() {
    setState(() {
      food.insert(0, nameController.text);
    });
  }

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
          ElevatedButton(
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
  }

  @override
  Widget build2(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> InteractiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(InteractiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
