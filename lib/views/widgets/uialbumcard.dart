part of 'widgets.dart';

class AlbumCard extends StatefulWidget {
  final SpotifyAlbum listAlbum;
  const AlbumCard(this.listAlbum);

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    SpotifyAlbum dataAlbum = widget.listAlbum;
    return Container(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrackList(dataAlbum.id)),
            );
          },
          splashColor: Color.fromARGB(255, 143, 203, 255),
          child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '${dataAlbum.images![0].url}',
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
                      dataAlbum.name ?? '',
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
