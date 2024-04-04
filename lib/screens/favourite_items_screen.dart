import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/multiprovider_example.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProviderObject = Provider.of<MultiProviderExample>(context);
    /// This screen will display all the Favourite Items of List
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        )),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: favouriteProviderObject.selectedItems.length,
                  itemBuilder: (context,index)
                      {
                        return ListTile(
                          title: Text("Item ${favouriteProviderObject.selectedItems.elementAt(index)}"),
                        );
                      }
              ) 
          )
        ],
      ),
    );
  }
}
