part of 'pages.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isHide = true;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> _signup() async {
    if (_signupKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Signup successful, navigate to the home screen or perform any required action.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuPage()),
        );
      } catch (e) {
        // Show an error message or perform any necessary error handling.
        print('Signup error: $e');
        setState(() {
          errorMessage = 'Failed to create an account';
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 19, 43),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(24, 48, 24, 0),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Form(
                      key: _signupKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Signup",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _usernameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.cyan),
                              filled: true,
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email, color: Colors.cyan),
                              filled: true,
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            obscureText: isHide,
                            controller: _passwordController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock, color: Colors.cyan),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isHide
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            obscureText: isHide,
                            controller: _confirmPasswordController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock, color: Colors.cyan),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isHide
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          if (errorMessage.isNotEmpty)
                            Text(
                              errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(48, 4, 48, 4),
                            child: ElevatedButton(
                              onPressed: _signup,
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 91, 192, 190),
                                elevation: 3,
                                shadowColor: Colors.cyan,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
