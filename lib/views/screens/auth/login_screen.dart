
import 'package:firetap/const.dart';

import 'package:firetap/views/screens/auth/signup.dart';

import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 hintText: 'Email',
//                 prefixIcon: Icon(
//                   Icons.email,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 hintText: 'Password',
//                 prefixIcon: Icon(
//                   Icons.lock,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 40,
//                 height: 44,
//                 decoration: BoxDecoration(
//                   color: buttonColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: InkWell(
//                   onTap: () =>
//                       authControllers.loginUser(email.text, password.text),
                 


//                 child: Center(
//                     child: Text(
//                   'Login',
//                   style: TextStyle(fontSize: 19.6, fontWeight: FontWeight.bold),
//                 ),
//                 ),
//               ),
//              ),
//             ),
//             SizedBox(
//               height: 11,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Don't have an Account?",
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => SignUp()));
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: butColor,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 44,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () =>
                      authControllers.loginUser(_email.text, _password.text),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 19.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account?",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 14,
                      color: butColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}