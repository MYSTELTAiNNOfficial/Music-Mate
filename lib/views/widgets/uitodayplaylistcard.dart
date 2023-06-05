part of 'widgets.dart';

class TodayPlaylistCard extends StatefulWidget {
  final SpotifyPlaylist listToday;
  const TodayPlaylistCard(this.listToday);

  @override
  _TodayPlaylistCardState createState() => _TodayPlaylistCardState();
}

class _TodayPlaylistCardState extends State<TodayPlaylistCard> {
  @override
  Widget build(BuildContext context) {
    SpotifyPlaylist dataTrack = widget.listToday;
    return Container(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Player(dataTrack.track!.uri)),
            );
          },
          splashColor: Color.fromARGB(255, 143, 203, 255),
          child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  Text(
                    dataTrack.track!.id ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        overflow: TextOverflow.ellipsis),
                  ),
                  CachedNetworkImage(
                    imageUrl: '${dataTrack.track!.album!.images![0].url}',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => UiLoading.loading(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black26,
                          Colors.black54
                        ],
                      ),
                    ),
                    child: Text(
                      dataTrack.track!.name ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ))),
    );
  }
}
