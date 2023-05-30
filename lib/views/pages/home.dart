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

  Future<SpotifyBearer> getToken() async {
    var test = await SpotifyService.getAccessToken();
    setState(() {
      token = test;
    });
    getNewRelease();
    return token;
  }

	Future<void> connectToSpotifyRemote() async {
    try {
      setState(() {
        isLoading = true;
      });
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: Const.CLIENT_ID2,
          redirectUrl: Const.REDIRECT_URL);
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
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: isLoading
            ? UiLoading.loading()
            : Column(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("data",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 200,
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
                ],
              ));
  }
}
