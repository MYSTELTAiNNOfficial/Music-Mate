part of 'pages.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 19, 43),
      body: Stack(
        children: [
          (AuthService.auth.currentUser != null)
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.fromLTRB(40, 48, 40, 16),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.center,
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 255, 233),
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(height: 36),
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Color.fromARGB(255, 111, 255, 233),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "${AuthService.auth.currentUser!.photoURL}",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username",
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 255, 233),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.cyanAccent,
                                width: 5,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            labelText: AuthService.username ?? '',
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 255, 233),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.cyanAccent,
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            labelText:
                                AuthService.auth.currentUser!.email ?? '',
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () async {
                              await AuthService.signOut().then((value) {
                                if (value) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                  UiToast.toastOk("Logout successful!");
                                } else {
                                  UiToast.toastErr("Logout failed!");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyanAccent,
                              elevation: 0,
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Log Out"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_rounded,
                          color: Color.fromARGB(255, 111, 255, 233),
                          size: 100.0,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await AuthService.signInWithGoogle().then(
                                (value) {
                                  UiToast.toastOk("Welcome back");
                                },
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 111, 255, 233),
                              elevation: 3,
                              textStyle: TextStyle(fontSize: 16),
                              shadowColor: Colors.cyanAccent,
                              padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            label: Text(
                              'Login Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
