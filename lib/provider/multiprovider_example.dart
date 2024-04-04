
import 'package:flutter/material.dart';

class MultiProviderExample with ChangeNotifier
{
  double value=1.0;

  /// The below method will update the value of a Slider
  void updateValue(double updatedValue)
  {
    value = updatedValue;
    notifyListeners();
  }

  double get getValue => value;


  /// Favourite Provider
  List<int> selectedItems=[];

  List<int> get getSelectedItems => selectedItems;

  /// Below method will add the items to selectedItems List
  void addItem(int index)
  {
    selectedItems.add(index);
    notifyListeners();
  }

  /// Below method will remove the items from SelectedItems List
  void removeItem(int index)
  {
    selectedItems.remove(index);
    notifyListeners();
  }


}