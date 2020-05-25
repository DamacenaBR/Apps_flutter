import 'package:flutter/foundation.dart';

class IncrementeProvider extends ChangeNotifier{
  int valor= 0;
  void incremente(){
    valor++;
    notifyListeners();
  }
}