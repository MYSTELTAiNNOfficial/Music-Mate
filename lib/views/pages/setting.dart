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
        appBar: AppBar(
          title: Text('Setting'),
        ),
        backgroundColor: Color.fromARGB(255, 11, 19, 43),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  children: [
                    Text("Account Setting",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            decoration: TextDecoration.underline)),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.fromLTRB(24, 14, 24, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Authorize Spotify")),
                  ],
                ))
          ],
        ));
  }
}
