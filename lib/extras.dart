/*Admin Button for Welcome

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 60),
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Admin_LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: ourOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Admin Login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

  Sign Up Button for Admin 
  TextButton(
                            onPressed: () {
                             Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Admin_SignUpPage()));
                            },
                            child: const Text(
                              ' Sign Up as an Admin',
                              style: TextStyle(
                                color: ourOrange,
                                fontSize: 14,
                              ),
                            )),
                        const Text(
                          'or',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),


Sign Up on Pressed User

() {
                          String email = emailField.text.toString();
                          String password = passwordField.text.toString();
                          String confirmPass = confirmPassField.text.toString();

                          Fluttertoast.showToast(
                            msg: 'You are now Registered as a User',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: ourOrange,
                            timeInSecForIosWeb: 3,
                            fontSize: 15,
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const User_LoginPage()));
                        },

  Navigation Bar 
  unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Favourites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined), label: 'Play'),
        BottomNavigationBarItem(
            icon: Icon(Icons.feedback), label: 'Feedback')
      ],
 */