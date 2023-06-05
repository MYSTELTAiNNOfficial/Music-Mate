part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  SpotifyBearer token = new SpotifyBearer();
  List<SpotifyAlbum> newRelease = [];
  List<SpotifyTracklist> popular = [];
  // List<SpotifyArtist> artist = [];
  List<SpotifyPlaylist> todayPlaylist = [];

  Future<SpotifyBearer> getToken() async {
    var test = await SpotifyService.getAccessToken();
    setState(() {
      token = test;
    });
    getNewRelease();
    getPopular();
    // getArtist();
    getTodayPlaylist();
    return token;
  }

  Future<void> connectToSpotifyRemote() async {
    try {
      setState(() {
        isLoading = true;
      });
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: Const.CLIENT_ID2, redirectUrl: Const.REDIRECT_URL);
      UiToast.toastOk(result
          ? 'connect to spotify successful'
          : 'connect to spotify failed');
      setState(() {
        isLoading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        isLoading = false;
      });
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      setState(() {
        isLoading = false;
      });
      UiToast.toastErr('not implemented');
    }
  }

  Future<List<SpotifyAlbum>> getNewRelease() async {
    print(token.accessToken);
    await SpotifyService.getNewReleaseAlbum(token.accessToken).then((value) {
      if (value != null) {
        setState(() {
          newRelease = value;
        });
      }
    });
    connectToSpotifyRemote();
    return newRelease;
  }

  Future<List<SpotifyTracklist>> getPopular() async {
    print(token.accessToken);
    dynamic albumId = "37i9dQZEVXbMDoHDwVN2tF";
    await SpotifyService.getPopularbyAlbumId(token.accessToken, albumId)
        .then((value) {
      if (value != null) {
        setState(() {
          popular = value;
        });
      }
    });
    connectToSpotifyRemote();
    return popular;
  }

  Future<List<SpotifyPlaylist>> getTodayPlaylist() async {
    print(token.accessToken);
    dynamic todayId = "37i9dQZF1DXcBWIGoYBM5M";
    await SpotifyService.getTodayPlaylist(token.accessToken, todayId)
        .then((value) {
      if (value != null) {
        setState(() {
          todayPlaylist = value;
        });
      }
    });
    connectToSpotifyRemote();
    return todayPlaylist;
  }

  @override
  void initState() {
    isLoading = true;
    getToken().then((value) => token = value);
    super.initState();
  }

  @override
  void dispose() {
    newRelease.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 11, 19, 43),
      body: isLoading
          ? UiLoading.loading()
          : Column(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 32, bottom: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color: Color.fromARGB(255, 111, 255, 233),
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("New Releases",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                SizedBox(
                  height: 150,
                  child: newRelease.isEmpty
                      ? const Align(
                          alignment: Alignment.center,
                          child: Text("Ups, tidak ada data"))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newRelease.length,
                          itemBuilder: ((context, index) {
                            return LazyLoadingList(
                                initialSizeOfItems: 10,
                                loadMore: () {},
                                child: AlbumCard(newRelease[index]),
                                index: index,
                                hasMore: true);
                          })),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("Popular Album",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                SizedBox(
                  height: 150,
                  child: popular.isEmpty
                      ? const Align(
                          alignment: Alignment.center,
                          child: Text("Ups, tidak ada data",
                              style: TextStyle(color: Colors.white)))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popular.length,
                          itemBuilder: ((context, index) {
                            return LazyLoadingList(
                                initialSizeOfItems: 10,
                                loadMore: () {},
                                child: PopularCard(popular[index]),
                                index: index,
                                hasMore: true);
                          })),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("Today Top Hits",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                SizedBox(
                  height: 150,
                  child: todayPlaylist.isEmpty
                      ? const Align(
                          alignment: Alignment.center,
                          child: Text("Ups, tidak ada data",
                              style: TextStyle(color: Colors.white)))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: todayPlaylist.length,
                          itemBuilder: ((context, index) {
                            return LazyLoadingList(
                                initialSizeOfItems: 10,
                                loadMore: () {},
                                child: TodayPlaylistCard(todayPlaylist[index]),
                                index: index,
                                hasMore: true);
                          })),
                ),
              ],
            ),
    );
  }
}
