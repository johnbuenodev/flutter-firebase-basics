import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePagefirebase extends StatefulWidget {
  @override
  _HomePagefirebaseState createState() => _HomePagefirebaseState();
}

class _HomePagefirebaseState extends State<HomePagefirebase> {

  final Firestore FirebaseConnector = Firestore.instance;

  var Dados = "";
  var id = "";
  var name = "";
  var price = "";

  final TextStyloButtons =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  final spaceitem = EdgeInsets.fromLTRB(0, 15, 0, 15);

  void _create() async {
    try{
      await FirebaseConnector.collection('products').document('1').setData(
          {
            'ProdName':'Fone Gamer',
            'price': 32.55
          });
      setState(() {
        Dados = "";
      });
    } catch(e){
      print(e);
    }
  }

  //get()  setData() delete()

  void _read() async {
    DocumentSnapshot documentSnapshot;
    var id_busca = '1';
    try{
      documentSnapshot = await FirebaseConnector.collection('products').document(id_busca).get();
      print(documentSnapshot.data);
      if(documentSnapshot.exists) {

        id = id_busca;
        name = documentSnapshot.data['ProdName'].toString();
        price = documentSnapshot.data['price'].toString();
        setState(() {
          Dados = id + "|" + name + "|" + price;
        });
      }
    } catch(e){
      print(e);
    }
  }

  void _update() async {
    var id_busca = '1';
    try{
      await FirebaseConnector.collection('products').document(id_busca).updateData({'price':55.36});
      setState(() {
        Dados = "";
      });
    }catch(e){
      print(e);
    }
  }

  void _delete() async {
    var id_busca = '1';
    try{
      await FirebaseConnector.collection('products').document(id_busca).delete();
      setState(() {
        Dados = "";
      });
    }catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Firebase Basic CRUD",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
         actions: <Widget>[
           Padding(
             padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
            child: Icon(Icons.filter_drama,color: Colors.white,size: 45,)
           ),
         ],
          ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Dados,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 25.0),
                ),
                RaisedButton(
                  onPressed: _create,
                  color: Colors.green,
                  child: Text(
                    "CRIAR",
                    style: TextStyloButtons,
                  ),
                ),
                Padding(
                  padding: spaceitem,
                ),
                RaisedButton(
                  onPressed: _read,
                  color: Colors.blue,
                  child: Text(
                    "LER",
                    style: TextStyloButtons,
                  ),
                ),
                Padding(
                  padding: spaceitem,
                ),
                RaisedButton(
                    onPressed: _update,
                    color: Colors.deepOrange,
                    child: Text(
                      "ATUALIZAR",
                      style: TextStyloButtons,
                    )),
                Padding(
                  padding: spaceitem,
                ),
                RaisedButton(
                  onPressed: _delete,
                  color: Colors.red,
                  child: Text(
                    "DELETER",
                    style: TextStyloButtons,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
