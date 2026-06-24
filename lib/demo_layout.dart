import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Résultats du match"),
            Score(),
            FilledButton.icon(
              icon: Icon(Icons.sports_soccer),
                onPressed: (){},
                label: Text("Voir les buteurs"),
            ),
            Row(children: [
              Icon(Icons.sports_soccer),
              Expanded(child: Text("Le sbuteurs sont mlorem ipsum dolor sit amet sdfsdfsdfiozehfui")),
              Icon(Icons.sports_soccer),
            ],)
          ],
        )
      ),
    );
  }
}

class Score extends StatelessWidget {
  const Score({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerENI(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text("🇫🇷"),
          Text("3 - 0"),
          Text("🇮🇶"),
        ],
      ),
    );
  }
}

class ContainerENI extends StatelessWidget {
  final Widget child;
  const ContainerENI({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.amber
      ),
      child: child,
    );
  }
}

