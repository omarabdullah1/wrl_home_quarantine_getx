//
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key key}) : super(key: key);
//
//   @override
//   _State createState() => _State();
// }
//
// class _State extends State<LoginScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Login'),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(10),
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Home Quarantine App',
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 30),
//                     )),
//                 Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'Sign in',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'User Name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: TextField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                     ),
//                   ),
//                 ),
//
//                 Container(
//                     height: 50,
//                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: RaisedButton(
//                       textColor: Colors.white,
//                       color: Colors.blue,
//                       child: const Text('Login'),
//                       onPressed: () {
//                         print(nameController.text);
//                         print(passwordController.text);
//
//                       },
//                     )),
//                 Row(
//                   children: const <Widget>[
//                     Text('Does not have account?'),
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 )
//               ],
//             )));
//   }
// }