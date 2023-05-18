part of 'pages.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 19, 43),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            'Playlist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ));
  }
}
