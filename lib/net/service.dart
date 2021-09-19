import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String name, id, image, chefName, timee, colors;

Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection("User");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.doc(uid).set({'displayName': displayName, 'uid': uid});
  return;
}

// ignore: missing_return
Future<String> findType(String type) async {
  CollectionReference recipes = FirebaseFirestore.instance.collection("Recipe");
  recipes
      .where("type", isEqualTo: type)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc.data()['name']);

      //image = doc.data()["image"];
      /*  time = doc.data()["time"];
        description = doc.data()["description"];
        type = doc.data()["type"]; */
    });
  });
}

int i = 5;
String malzeme = "deneme" + i.toString();
Future<String> searchWord(String search) async {
  CollectionReference recipes = FirebaseFirestore.instance.collection("Recipe");
  recipes
      .where("ingredient5", isEqualTo: search)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc.data()['name']);

      //image = doc.data()["image"];
      /*  time = doc.data()["time"];
        description = doc.data()["description"];
        type = doc.data()["type"]; */
    });
  });
}

Future<List<dynamic>> getList() async {
  //malzemeleri listeliyor
  var firestore = FirebaseFirestore.instance;

  DocumentReference docRef = firestore.collection('Recipe').doc("4");

  return docRef.get().then((datasnapshot) {
    if (datasnapshot.exists) {
      List<dynamic> info = datasnapshot.data()['malzeme'].toList();
      print('#');
      print(info);
      print(info.length);
      for (int i = 0; i < info.length; i++) {
        print(info[i]);
      }
      return info;
    }
  });
}

List nameList = [];
List idList = [];
List imageList = [];
List chefNames = [];
List times = [];
List color = [];
Future<String> findIntgredient(String intg) async {
  //malzemeleri listeliyor

  var firestore = FirebaseFirestore.instance;
  CollectionReference recipes = firestore.collection('Recipe');
  QuerySnapshot _myDoc = await recipes.get();
  List<DocumentSnapshot> _myDocCount = _myDoc.docs;

  for (int i = 0; i < _myDocCount.length; i++) {
    DocumentReference docRef = recipes.doc(i.toString());

    docRef.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        List<dynamic> info = datasnapshot.data()['stufs'].toList();

        for (int i = 0; i < info.length; i++) {
          if (info[i] == intg) {
            id = datasnapshot.data()['id'];
            name = datasnapshot.data()['name'];
            image = datasnapshot.data()['imageIcon'];
            chefName = datasnapshot.data()['chef'];
            timee = datasnapshot.data()['time'];
            colors = datasnapshot.data()['color'];
            color.add(colors);
            chefNames.add(chefName);
            times.add(timee);
            nameList.add(name);
            idList.add(id);
            imageList.add(image);

            print(nameList);
            print(idList);
            print(imageList);
            print(chefNames);
            //print(deneme);
          }
        }
      }
    });
  }
  nameList.clear();
  idList.clear();
  imageList.clear();
  chefNames.clear();
  color.clear();
  times.clear();
}
