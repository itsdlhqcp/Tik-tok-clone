import 'package:firetap/const.dart';
// import 'package:firetap/controllers/auth_controller.dart';
import 'package:firetap/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  //  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                     backgroundImage: NetworkImage(
                        'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                    // backgroundImage: NetworkImage("https://www.pngkit.com/png/detail/203-2035011_graphic-design-transparent-user-icon-png.png"),
                    backgroundColor: Colors.blueGrey,
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () => authControllers.pickImage(),
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 35,
                          )))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      17,
                    ),
                  ),
                  hintText: 'Username',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      17,
                    ),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      17,
                    ),
                  ),
                  hintText: 'password',
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 44,
                  decoration: BoxDecoration(
                    color: regColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => authControllers.registerUser(
                        _username.text, _email.text, _password.text, authControllers.profilePhoto),
                    child: Center(
                        child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 19.6, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: buttonColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
