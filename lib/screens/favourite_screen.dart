import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/multiprovider_example.dart';
import 'package:provider_example/screens/favourite_items_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("favourite Screen build");
    //final favouriteProviderObject = Provider.of<MultiProviderExample>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites App",style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavouriteItemsScreen()));
            },
              child: const Icon(Icons.favorite,color: Colors.white,size: 25,)
          ),
          const SizedBox(width: 25,)
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index)
                    {
                      return Consumer<MultiProviderExample>(
                        builder: (context,provider,child)
                          {
                            return ListTile(
                              title: Text("Item $index",style: const TextStyle(fontSize: 20)),
                              onTap: (){
                                if(provider.selectedItems.contains(index))
                                  {
                                    provider.removeItem(index);
                                  }
                                else
                                  {
                                    provider.addItem(index);
                                  }
                              },
                              trailing: (provider.selectedItems.contains(index)) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
                            );
                          }
                      );
                    }
            ),
          )
        ],
      )
    );
  }
}
