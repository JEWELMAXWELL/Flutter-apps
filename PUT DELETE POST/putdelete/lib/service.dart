import 'dart:convert';

import 'package:http/http.dart' as http;

const String url='https://631c37911b470e0e12fcdd0b.mockapi.io/api';

class Service {
  var name=http.Client();
  Future<dynamic> post(String variable,dynamic object)async
  {
   var postname =  Uri.parse(url+variable);
   var postencode = json.encode(object);
   var postbody = {
    'Authorization': 'Bearer sfie328370428387=',
      'Content-Type':'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989'
   };
   var varname=await name.post(postname,body: postencode,headers: postbody );
   if(varname.statusCode==201)
   {
    return varname.body;


   }

  }
  Future<dynamic> put(String variable,dynamic object)async
  {
       var postname =  Uri.parse(url+variable);
   var postencode = json.encode(object);
   var postbody = {
    'Authorization': 'Bearer sfie328370428387=',
      'Content-Type':'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989'
   };
   var varname=await name.put(postname,body: postencode,headers: postbody );
   if(varname.statusCode==200)
   {
    return varname.body;


   } 




  }
  Future<dynamic> del(String variable)async
  {

    var deletename =  Uri.parse(url+variable);
      var pstbody = {
    'Authorization': 'Bearer sfie328370428387=',
    'api_key': 'ief873fj38uf38uf83u839898989'
    };
   var delname = await name.delete(deletename,headers: pstbody);
   if(delname.statusCode==200){
    return delname.body;

   }else{
    print(delname.statusCode.toString());
   }
   

  }






}
