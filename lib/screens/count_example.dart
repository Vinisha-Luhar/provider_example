import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProviderObject = Provider.of<CountProvider>(context,listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ChangeNotifierProvider Example"),
      ),
      body: Center(
          child: Consumer<CountProvider>(
            builder: (context,provider,child)
            {
              print("only this widget buidls");
              return Text("${provider.count}",
                style: const TextStyle(fontSize: 50),);
            }
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProviderObject.incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
