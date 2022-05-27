import 'package:stacked/stacked.dart';

class TextFieldViewModel extends BaseViewModel{
  bool _hidden = true;

  bool get isHidden => _hidden;

  toggleVisibility(){
    _hidden = !_hidden;
    notifyListeners();
  }
}