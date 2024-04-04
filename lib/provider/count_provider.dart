import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier
{
  int count=0;
  int get getCount => count;

  /// Method to increment Count Variable
  void incrementCount()
  {
    count++;
    /// This will listen to changes and will notify its widgets
    notifyListeners();
  }

}