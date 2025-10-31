import 'package:flutter/cupertino.dart';
import 'package:kmarket_shopping/services/token_storage_service.dart';

class AuthProvider with ChangeNotifier{
  final _tokenStorageService = TokenStorageService();
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider(){
    _checkLoginStatus();
  }
  void _checkLoginStatus() async{
    final token = await _tokenStorageService.readToken();
    if(token != null){
      _isLoggedIn =true;

      notifyListeners();
    }
  }
  void login(String token) async{
    await _tokenStorageService.saveToken(token);
    _isLoggedIn=true;
    notifyListeners();
  }
  void logout() async{
    await _tokenStorageService.deleteToken();
    _isLoggedIn=false;
    notifyListeners();
  }
}