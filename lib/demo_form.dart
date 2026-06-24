import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ContactFormPage(),
    );
  }
}
class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _tecEmail = TextEditingController(text: "");
  bool _rememberMe = false;
  final _keyFormContact = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Form(
        key: _keyFormContact,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail",border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  controller: _tecEmail,
                  validator: (value){
                    if(value == null || value.isEmpty==true ){
                      return "Renseignez votre e-mail";
                    }else if(value.contains("@")){
                      return null;
                    }return "E-mail incorrect";
                  },
                ),
                Switch(value: _rememberMe, onChanged: (newValue){
                  setState(() {
                    _rememberMe = newValue;
                  });
                }),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                      onPressed: (){
                        _keyFormContact.currentState?.validate();
                      },
                      child: Text("Enregister mes infos")),
                )
              ],
            ),
          )
      ),
    );
  }
}














