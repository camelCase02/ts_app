

import 'package:amazon_clone/constants/global_veriables.dart';
import 'package:amazon_clone/models/user.dart';

import 'package:http/http.dart' as http;
class AuthService{
  
void createAccount({  required String email,   required String name,   required String password, })async{

try{
  User user=User(id: "", name: name, password: password, address: "", type: "", token: "", email: email);
 
 http.Response res= await http.post(Uri.parse("$uri/api/signup"), body:
    user.toJson(),headers: <String, String>{
      'Content-Type':'application/json; charset=UTF-8'
    }
    

  );
}catch(e){

}

}




}