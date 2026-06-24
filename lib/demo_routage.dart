import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (_, _) => HomePage(),
        routes: [
          GoRoute(
            path: "settings/:idSettings",
            builder: (_, state) => SettingsPage(
                state.pathParameters["idSettings"] ??''
            )
          )
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: _router,
    );
  }
}

//stl -> Pour créer un stateless widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //scf pour créer un Scaffold Widget
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: TextButton(
          child: Text("Aller vers Paramètres"),
          onPressed: () {
            context.go("/settings/5");
          }),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final String idSettings;
  const SettingsPage(this.idSettings,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Text("Paramètre $idSettings demandé"),
    );
  }
}
