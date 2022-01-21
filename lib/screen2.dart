import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List list=[];
  getData() async{

    final url=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=peshawar,{state%20code}&appid=d7a80340ab49f07095c966aae5ea805a'));
   var repsonse=jsonDecode(url.body);

   list.add(repsonse);

    return list;


    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Api'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot)
        {
          if(snapshot.hasData)
            {
              return Card(
                child: Column(
                  children: [
                    Text('${snapshot.data[0]["name"]}'),
                    const SizedBox(height: 20,),
                    Text('${snapshot.data[0]["main"]["temp"]}'),
                    const SizedBox(height: 20,),

                    Text('${snapshot.data[0]['main']['humidity']}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Text('${snapshot.data[0]['sys']['country']}'),
                    const SizedBox(height: 20,),
                    Text('${snapshot.data[0]['sys']['type']}'),
                    const SizedBox(height: 20,),
                    Text('${snapshot.data[0]['weather'][0]['main']}'),



                  ],
                ),
              );
            }
          else
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: ()
        {

          getData();

        },
        child: const Text('show'),
      ),
    );
  }
}



// class Weather {
//
//   String name;
//   double temp;
//   double humidity;
//
//   Weather({required this.name, required this.temp,required this.humidity});
// }
