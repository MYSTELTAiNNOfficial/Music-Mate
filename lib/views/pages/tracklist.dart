part of 'pages.dart';

class TrackList extends StatefulWidget {
  final dynamic AlbumId;
  const TrackList(this.AlbumId);

  @override
  State<TrackList> createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  bool isLoading = false;
  SpotifyBearer token = new SpotifyBearer();
  List<SpotifyTracklist> tracklist = [];

  Future<SpotifyBearer> getToken() async {
    var test = await SpotifyService.getAccessToken();
    setState(() {
      token = test;
    });
    getTracklist();
    return token;
  }

  Future<List<SpotifyTracklist>> getTracklist() async {
    print(token.accessToken);
    await SpotifyService.getTracklistbyAlbumId(
            token.accessToken, widget.AlbumId)
        .then((value) {
      if (value != null) {
        setState(() {
          tracklist = value;
          isLoading = false;
        });
      }
    });
    return tracklist;
  }

  @override
  void initState() {
    isLoading = true;
    getToken().then((value) => token = value);
    super.initState();
  }

  @override
  void dispose() {
    tracklist.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracklist'),
      ),
      body: isLoading
          ? UiLoading.loading()
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: tracklist.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("Ups, tidak ada data",
                          style: TextStyle(color: Colors.white)))
                  : ListView.builder(
                      itemCount: tracklist.length,
                      itemBuilder: ((context, index) {
                        return LazyLoadingList(
                            initialSizeOfItems: 10,
                            loadMore: () {},
                            child: TracklistCard(tracklist[index]),
                            index: index,
                            hasMore: true);
                      })),
            ),
    );
  }
}
