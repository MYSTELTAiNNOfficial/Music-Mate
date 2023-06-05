part of 'widgets.dart';

class PopularCard extends StatefulWidget {
  final SpotifyTracklist listAlbum;
  const PopularCard(this.listAlbum);

  @override
  _PopularCardState createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    SpotifyTracklist dataPopular = widget.listAlbum;
    return Container(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TrackList(dataPopular.id)),
            );
          },
          splashColor: Color.fromARGB(255, 143, 203, 255),
          child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: '${dataPopular.artists[0].uri}',
                  //   fit: BoxFit.fill,
                  //   placeholder: (context, url) => UiLoading.loading(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
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
                      dataPopular.name ?? '',
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
