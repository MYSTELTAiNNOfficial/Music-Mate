part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final SplashDelay = 4;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var duration = Duration(seconds: SplashDelay);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 19, 43),
      body: Container(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
