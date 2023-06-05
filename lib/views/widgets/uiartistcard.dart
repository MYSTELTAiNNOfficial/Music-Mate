part of 'widgets.dart';

class ArtistCard extends StatefulWidget {
  final SpotifyArtist listArtist;
  const ArtistCard(this.listArtist);

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  @override
  Widget build(BuildContext context) {
    SpotifyArtist dataArtist = widget.listArtist;
    return Container(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrackList(dataArtist.id)),
            );
          },
          splashColor: Color.fromARGB(255, 143, 203, 255),
          child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '${dataArtist.images![0].url}',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => UiLoading.loading(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // CircleAvatar(
                  //   radius: 55,
                  //   backgroundColor: Color.fromARGB(255, 111, 255, 233),
                  //   child: CircleAvatar(

                  //     radius: 50,
                  //     backgroundImage: NetworkImage(
                  //       "${dataArtist.images![0].url}",

                  //     ),

                  //   ),
                  // ),
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
                      dataArtist.name ?? '',
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
