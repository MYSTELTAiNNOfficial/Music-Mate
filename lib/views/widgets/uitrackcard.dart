part of 'widgets.dart';

class TracklistCard extends StatefulWidget {
  final SpotifyTracklist dataTracklist;
  const TracklistCard(this.dataTracklist);

  @override
  _TracklistCardState createState() => _TracklistCardState();
}

class _TracklistCardState extends State<TracklistCard> {
  //Source: https://stackoverflow.com/questions/54775097/formatting-a-duration-like-hhmmss
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    SpotifyTracklist dataTracklist = widget.dataTracklist;
    return Card(
      color: Color.fromARGB(255, 91, 192, 190),
      margin: const EdgeInsets.fromLTRB(16, 8, 20, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Player(
                      dataTracklist.uri,
                    )),
          );
        },
        splashColor: Color.fromARGB(255, 143, 203, 255),
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          title: Text("${dataTracklist.name}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 11, 19, 43))),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                "${dataTracklist.artists![0].name}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _printDuration(
                    Duration(milliseconds: dataTracklist.durationMs!)),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
