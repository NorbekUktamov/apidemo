
import 'package:flutter/material.dart';

import 'package:api_demo/models/model.dart';

import '../services/http_service.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     var employee = User(id: 25, name: "Flutter", salary: "99999", age: "20");
    //_apiDelete(employee);
    //_apiGetList();
   //_apiPostCreate(employee);
   //_apiPutUpdate(employee);
   _apiGetOne();


  }

  void _apiGetList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiGetOne(){
    Network.GETOne(Network.API_ONE + 1.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }




  void _apiPostCreate(User  user){
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPutUpdate(User user){
    Network.PUT(Network.API_UPDATE + user.id.toString(), Network.paramsUpdate(user)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiDelete(User user){
    Network.DEL(Network.API_DELETE + user.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}