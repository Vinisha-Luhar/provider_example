import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/multiprovider_example.dart';

class MultiProviderScreen extends StatefulWidget {
  const MultiProviderScreen({Key? key}) : super(key: key);

  @override
  State<MultiProviderScreen> createState() => _MultiProviderScreenState();
}

class _MultiProviderScreenState extends State<MultiProviderScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final multiProviderObject = Provider.of<MultiProviderExample>(context,listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<MultiProviderExample>(
            builder: (context,provider,child)
            {
              return Slider(
                  value: provider.value,
                  onChanged: (changedValue)
                  {
                    provider.updateValue(changedValue);
                  }
              );
            }
          ),
          Consumer<MultiProviderExample>(
              builder: (context,provider,child)
                  {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.2,
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(multiProviderObject.getValue)
                            ),
                            child: const Center(
                              child: Text("Green Container",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.2,
                            decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(multiProviderObject.getValue)
                            ),
                            child: const Center(
                              child: Text("Yellow Container",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
          ),
        ],
      ),
    );
  }
}
