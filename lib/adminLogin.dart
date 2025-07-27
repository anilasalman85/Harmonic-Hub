import 'package:flutter/material.dart';

import 'adminSignUp.dart';
import 'main.dart';
import 'welcome.dart';
class Admin_LoginPage extends StatefulWidget {
  const Admin_LoginPage({Key? key}) : super(key: key);

  @override
  _Admin_LoginPageState createState() => _Admin_LoginPageState();
}

class _Admin_LoginPageState extends State<Admin_LoginPage> {
  var passwordField = TextEditingController();
  var userField = TextEditingController();
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepOrangeAccent.withOpacity(0.8),
            Colors.orangeAccent.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()));
                    },
                    tooltip: 'Go Back to Welcome',
                    splashColor: ourOrange,
                    hoverColor: ourOrange,
                    enableFeedback: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 150,
                          height: 150,
                          color: ourOrange,
                          child: const CircleAvatar(
                            child: Image(
                              image: AssetImage('images/final_logo.jpg'),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Center(
                      child: Text(
                        'Admin Sign In Page',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: userField,
                        keyboardType: TextInputType.name,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Admin User Name',
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: const TextStyle(color: ourOrange),
                          hintText: 'Admin Username',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: ourOrange),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: ourOrange),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_4_sharp,
                            color: ourOrange,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: passwordField,
                        keyboardType: TextInputType.visiblePassword,
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: ourOrange),
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: ourOrange),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: ourOrange),
                            ),
                            prefixIcon: const Icon(
                              Icons.security_sharp,
                              color: ourOrange,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: Icon(
                                _obsecureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: ourOrange,
                              ),
                            )),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                        obscureText: _obsecureText,
                        maxLength: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: ourOrange),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 150),
                      child: ElevatedButton(
                        onPressed: () {
                          String username = userField.text.toString();
                          String password = passwordField.text.toString();
                        
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: ourOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Admin_SignUpPage()));
                            },
                            child: const Text(
                              ' Sign Up as an Admin',
                              style: TextStyle(
                                color: ourOrange,
                                fontSize: 14,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
