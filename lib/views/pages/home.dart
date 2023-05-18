part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 19, 43),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ));
  }
}
