import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginflutterapp/models/user_model.dart';
import 'package:loginflutterapp/screens/login_screen.dart';
import 'package:loginflutterapp/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async{

  runApp(MyApp());
  /*
  Firestore.instance.collection("mensagens").document().setData({
    'nome': 'keynes',
    'mensagem' : 'oi, tudo bem?'
  }); */
  QuerySnapshot snapshot = await Firestore.instance.collection('mensagens').getDocuments();
  snapshot.documents.forEach((d){
    print(d.data);
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child:  MaterialApp(
        title: 'Retomba',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.lightGreenAccent,
        ),
        home: Home(),//LoginScreen(),// Container(),
      ));
  }
}

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retomba App"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model ){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  Image(image: AssetImage('images/retomba.jpg')),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}"),
                  GestureDetector(
                    child:

                    Text(
                      !model.isLoggedIn()? "Entre ou cadastre-se >" : "Sair",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: (){
                      if(!model.isLoggedIn())
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginScreen() )
                      );
                      else
                        model.signOut();
                    },
                  ),
                  SizedBox(height: 16.0,),




                ],
              )
          );
        },
      )
    );
  }
}


