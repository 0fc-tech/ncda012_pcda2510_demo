import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'demo_riverpod.g.dart';

void main() => runApp(ProviderScope(child: MyApp()));

@riverpod
String hellowWorld(Ref ref) {
  return ref.read(getHelloWorldMessageProvider);
}

@riverpod
String getHelloWorldMessage(Ref ref) {
  return "Hello World";
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Center(
            child: Container(
                child: Text(ref.read(hellowWorldProvider))
            )
        ),
      ),
    );
  }
}
