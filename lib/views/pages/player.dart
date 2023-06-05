part of 'pages.dart';

class Player extends StatefulWidget {
  final dynamic uri;
  const Player(this.uri);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool _connected = false;
  bool _loading = false;
  CrossfadeState? crossfadeState;
  late ImageUri? currentTrackImageUri;

  Future<void> connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: Const.CLIENT_ID2, redirectUrl: Const.REDIRECT_URL);
      UiToast.toastOk(result
          ? 'connect to spotify successful'
          : 'connect to spotify failed');
      if (result) {
        play(widget.uri);
      }
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future getPlayerState() async {
    try {
      return await SpotifySdk.getPlayerState();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> toggleRepeat() async {
    try {
      await SpotifySdk.toggleRepeat();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> setRepeatMode(RepeatMode repeatMode) async {
    try {
      await SpotifySdk.setRepeatMode(
        repeatMode: repeatMode,
      );
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> setShuffle(bool shuffle) async {
    try {
      await SpotifySdk.setShuffle(
        shuffle: shuffle,
      );
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> toggleShuffle() async {
    try {
      await SpotifySdk.toggleShuffle();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> play(uri) async {
    try {
      await SpotifySdk.play(spotifyUri: uri);
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> resume() async {
    try {
      await SpotifySdk.resume();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> skipNext() async {
    try {
      await SpotifySdk.skipNext();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> skipPrevious() async {
    try {
      await SpotifySdk.skipPrevious();
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  Future<void> seekTo() async {
    try {
      await SpotifySdk.seekTo(positionedMilliseconds: 20000);
    } on PlatformException catch (e) {
      UiToast.toastErr("${e.code} ${e.message}");
    } on MissingPluginException {
      UiToast.toastErr('not implemented');
    }
  }

  @override
  void initState() {
    super.initState();
    connectToSpotifyRemote();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<ConnectionStatus>(
        stream: SpotifySdk.subscribeConnectionStatus(),
        builder: (context, snapshot) {
          _connected = false;
          var data = snapshot.data;
          if (data != null) {
            _connected = data.connected;
          }
          return Scaffold(
              backgroundColor: Color.fromARGB(255, 11, 19, 43),
              body: _sampleFlowWidget(context));
        },
      ),
    );
  }

  Widget _sampleFlowWidget(BuildContext context2) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Divider(),
            _connected
                ? _buildPlayerStateWidget()
                : const Center(
                    child: Text('Not connected'),
                  )
          ],
        ),
        _loading
            ? Container(
                color: Colors.black12,
                child: const Center(child: CircularProgressIndicator()))
            : const SizedBox(),
      ],
    );
  }

  Widget _buildPlayerStateWidget() {
    return StreamBuilder<PlayerState>(
      stream: SpotifySdk.subscribePlayerState(),
      builder: (BuildContext context, AsyncSnapshot<PlayerState> snapshot) {
        var track = snapshot.data?.track;
        currentTrackImageUri = track?.imageUri;
        var playerState = snapshot.data;

        if (playerState == null || track == null) {
          return Center(
            child: Container(),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 12, bottom: 8),
              alignment: Alignment.center,
              child: Text(
                "Player",
                style: TextStyle(
                  color: Color.fromARGB(255, 111, 255, 233),
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            _connected
                ? spotifyImageWidget(track.imageUri)
                : const Text('Connect to see an image...'),
            // Text(
            //   '${track.name} by ${track.artist.name} from the album ${track.album.name}',
            //   style: TextStyle(color: Colors.white),
            // ),
            SizedBox(height: 20),
            Text('${track.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Text('${track.artist.name}',
                style: TextStyle(color: Colors.white60, fontSize: 18)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //         'Progress: ${playerState.playbackPosition}ms/${track.duration}ms',
            //         style: TextStyle(color: Colors.white)),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: skipPrevious,
                  iconSize: 55,
                  color: Colors.white,
                  icon: Icon(Icons.skip_previous_rounded),
                ),
                playerState.isPaused
                    ? IconButton(
                        onPressed: resume,
                        iconSize: 55,
                        color: Colors.white,
                        icon: Icon(Icons.play_arrow_rounded),
                      )
                    : IconButton(
                        onPressed: pause,
                        iconSize: 55,
                        color: Colors.white,
                        icon: Icon(Icons.pause_rounded),
                      ),
                IconButton(
                  onPressed: skipNext,
                  iconSize: 55,
                  color: Colors.white,
                  icon: Icon(Icons.skip_next_rounded),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const Text(
                  'Set Shuffle and Repeat',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  children: [
                    const Text('Repeat Mode:',
                        style: TextStyle(color: Colors.white)),
                    DropdownButton<RepeatMode>(
                      dropdownColor: Colors.black87,
                      value: RepeatMode
                          .values[playerState.playbackOptions.repeatMode.index],
                      items: const [
                        DropdownMenuItem(
                          value: RepeatMode.off,
                          child: Text('off',
                              style: TextStyle(color: Colors.white)),
                        ),
                        DropdownMenuItem(
                          value: RepeatMode.track,
                          child: Text('track',
                              style: TextStyle(color: Colors.white)),
                        ),
                        DropdownMenuItem(
                          value: RepeatMode.context,
                          child: Text('context',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      onChanged: (repeatMode) => setRepeatMode(repeatMode!),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Set shuffle: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Switch.adaptive(
                      value: playerState.playbackOptions.isShuffling,
                      onChanged: (bool shuffle) => setShuffle(
                        shuffle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget spotifyImageWidget(ImageUri image) {
    return FutureBuilder(
        future: SpotifySdk.getImage(
          imageUri: image,
          dimension: ImageDimension.large,
        ),
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return Image.memory(snapshot.data!);
          } else if (snapshot.hasError) {
            UiToast.toastErr(snapshot.error.toString());
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(
                  child: Text('Error getting image',
                      style: TextStyle(color: Colors.white))),
            );
          } else {
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(
                  child: Text('Getting image...',
                      style: TextStyle(color: Colors.white))),
            );
          }
        });
  }
}
