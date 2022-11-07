/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safefoodie_login_merge/util/delete.dart';
import 'package:safefoodie_login_merge/Firebase/cloud/cloud_note.dart';

typedef ListCallback = void Function(CloudNote);

class ListsView extends StatelessWidget {
  final Iterable<CloudNote> lists;
  final ListCallback onDeleteNote;
  final ListCallback onTap;

  const ListsView({
    Key? key,
    required this.lists,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListsView.builder(
      itemCount: lists.length,
      itemBuilder: (context, index) {
        final list = lists.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(list);
          },
          title: Text(
            list.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteNote(list);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}

*/



//Begining of the comment out due to view edits



/* //======================================================================================
//VIEW LISTS PAGE START
//======================================================================================
class _ViewListsState extends State<ViewListsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: const Text('Account recovery')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child:
                        Text("Password reset", style: TextStyle(fontSize: 40)),
                  )
                ],
              ),
            ),
//======================================
//Text field
            Container(
              padding: EdgeInsets.only(top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    // controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter account email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
//======================================
// sign up button
                  Container(
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7,
                      child: GestureDetector(
                          onTap: () async {
                            //      _register();
                          },
                          child: Center(
                              child: Text('SEND RESET EMAIL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
//======================================
//back button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Go Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

//======================================================================================
//NAV FUNCTIONS
//======================================================================================
//Nav function for view lists page
  void _ToViewListsScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ViewListsPage()));
  }
}

//======================================================================================
//PAGE CLASS INITIALIZATION
//======================================================================================
//View lists page
class ViewListsPage extends StatefulWidget {
  @override
  _ViewListsState createState() => _ViewListsState();
} */
