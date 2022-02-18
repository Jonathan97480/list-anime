import 'package:flutter/material.dart';
import 'apiRequest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /* var listAnime = getAnime(); */

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return Center(child: Text('Loading'));
            }
            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text('Something went wrong :('));
            }

            return ListView.builder(itemBuilder: ( context, index){
            
              return Text(snapshot.data![index].title);

         

             

            },itemCount: snapshot.data!.lenght)
          },
          future: getAnime(),
          
        ));
  }
}
