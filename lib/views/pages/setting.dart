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
        body: Container(
          alignment: Alignment.center,
          child: Text(
            'Setting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ));
  }
}
