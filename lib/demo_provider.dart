import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<User>(
      create: (_)=> User("quentin@mail.com"),
      child: MaterialApp(
        title: 'Material App',
        routes:{
          "/": (_)=>HomePage(),
          "/login": (_)=>Loginpage()
        },
        initialRoute: "/login",
      ),
    );
  }
}
class User extends ChangeNotifier{
  String _email;

  set email(String email){
    _email = email;
    notifyListeners();
  }
  String get email => _email;
  User(this._email);
}
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final _tec = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Column(
        children: [
          TextFormField(
            controller: _tec,
          ),
          FilledButton(onPressed: (){
            context.read<User>().email = _tec.value.text;
            Navigator.pushReplacementNamed(context,"/");
          }, child: Text("Connexion")),
        ],
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Text("Bonjour : ${context.read<User>().email}"),
    );
  }
}

