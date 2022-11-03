import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//The following code is for CRUD database operations
//Not using firebase cloud
//has not been tested

//initialize the database
FirebaseDatabase database = FirebaseDatabase.instance;
FirebaseApp secondaryApp = Firebase.app('SafeFoodie');

//FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);

//Database reference
DatabaseReference ref = FirebaseDatabase.instance.ref();

//Write operations
DatabaseReference ref2 = FirebaseDatabase.instance.ref("users/123");

//Read Operations
//ignore this
//====================================================
//DatabaseReference starCountRef =
//  FirebaseDatabase.instance.ref('posts/$postId/starCount');
//startCountRef.onValue.listen((DatabaseEvent event){
// final data = event.snapshot.value;
// updateStarCount(data);
//});
//=======================================================
final ref3 = FirebaseDatabase.instance.ref();
//final snapshot = await ref.child('users/$userId').get();
//if(snapshot.exists){
//  print(snapshot.value);
//} else{
//  print('No data available.');
//}

//Updating and delete functions
void writeNewPost(String uID, String username, String profile, String title,
    String body) async {
  final postData = {
    'author': username,
    'uID': uID,
    'body': body,
    'title': title,
    'starCount': 0,
    'authorPic': profile,
  };
  final newPostKey = FirebaseDatabase.instance.ref().child('posts').push().key;
  final Map<String, Map> updates = {};
  updates['/posts/$newPostKey'] = postData;
  updates['/user-posts/$uID/$newPostKey'] = postData;

  return FirebaseDatabase.instance.ref().update(updates);
}
