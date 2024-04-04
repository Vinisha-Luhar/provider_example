import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/count_provider.dart';
import 'package:provider_example/provider/multiprovider_example.dart';
import 'package:provider_example/screens/count_example.dart';
import 'package:provider_example/screens/favourite_screen.dart';
import 'package:provider_example/screens/multiprovider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    //final futureProviderObject = Provider.of<FutureProviderExample>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountProvider()),
          ChangeNotifierProvider(create: (context) => MultiProviderExample()),
        ],
      child: MaterialApp(
        title: 'Provider Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
          CountExample()
        // const MultiProviderScreen(),
      ),
    );
  }
}
