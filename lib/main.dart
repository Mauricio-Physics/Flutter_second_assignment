import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'Json2Dart.dart';
import 'package:provider/provider.dart';
import 'UI.dart';


void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => JokeModel(),
      child: MyApp(),
    )

);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   AutoGenerate? model;
//
//   @override
//   Widget build(BuildContext context) {
//
//     // print(model?.value);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CHUCKNORRIS.IO',style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
//           centerTitle: true, toolbarHeight: 100
//       ),
//       // ignore: avoid_unnecessary_containers
//       body: Container(
//         child: Column(
//             children: [
//               column1(model?.value),
//               MaterialButton(
//                 onPressed: (){setState(() {
//                   API();
//                 });},
//                 child: Text('Press for New joke'),
//                 color: Colors.greenAccent,
//               ),
//               MaterialButton(
//                 onPressed: (){
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => FavoritesScreen()));
//                   // like button to add to favorites
//                 },
//                 child: Text('Press to Like'),
//                 color: Colors.orange,
//               ),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (ctx) =>
//                           AlertDialog(
//                             title: const Text("App Created at 09/06/2022 by Mauricio Salguero for the Flutter Development Course."),
//                             content: const Text(
//                                 "Thanks ¡"),
//                             actions: <Widget>[
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(ctx).pop();
//                                 },
//                                 child: Container(
//                                   color: Colors.green,
//                                   padding: const EdgeInsets.all(14),
//                                   child: const Text("okay"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                     );
//                   },
//                   child: const Text("Info"),
//                 ),
//               ),
//               MaterialButton(
//                 child: Text('Click for Web Page'),
//                 onPressed: () { launchUrl(Uri.parse(model?.url ?? 'https://api.chucknorris.io/jokes/random'));
//                   print(model?.url ?? 'https://api.chucknorris.io/jokes/random');},
//                 color: Colors.green,
//               ),
//
//             ]
//         ),
//       ),
//     );
//   }
//
//   Future<void> API() async {
//     Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
//     http.Response res = await http.get(url);
//     dynamic body = jsonDecode(res.body);
//     // print(body);
//     model = AutoGenerate.fromJson(body);
//     setState(() {});
//   }
// }
//
//
// class column1 extends StatelessWidget{
//
//    column1(
//        this.joke
//    );
//    late final String? joke;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//               child: Center(
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(color: Colors.white10),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text('$joke', style: TextStyle(fontSize: 20),),
//                   ),
//                 ),
//               ),
//             );
//
//   }
// }
//
//
// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }
//
// class _FavoritesScreenState extends State<FavoritesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('favorites'),
//       ),
//     );
//   }
// }




// class ChangeJokeButton extends StatefulWidget {
//   const ChangeJokeButton({Key? key}) : super(key: key);
//
//   @override
//   State<ChangeJokeButton> createState() => _ChangeJokeButtonState();
// }
//
// class _ChangeJokeButtonState extends State<ChangeJokeButton> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//     onPressed: (){setState(() {});},
//       child: Text('Press to change'),
//     );
//   }
// }



