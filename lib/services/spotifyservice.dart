part of 'services.dart';

class SpotifyService {
  static Future<SpotifyBearer> getAccessToken() async {
    var url = Uri.parse("https://accounts.spotify.com/api/token");
    var body = {
      "grant_type": "refresh_token",
      "refresh_token": Const.REFRESH_TOKEN
    };
    var response = await http.post(url, body: body, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Basic ${Const.CLIENT_ID}"
    });

    SpotifyBearer bearer = SpotifyBearer.fromMap(json.decode(response.body));
    return bearer;
  }

  static Future<List<SpotifyAlbum>> getNewReleaseAlbum(token) async {
    var url =
        Uri.parse("${Const.BASE_URL}browse/new-releases?limit=10&offset=0");
    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    List<SpotifyAlbum> data = [];
    print(token);
    var json = jsonDecode(response.body);
    print(json);
    data = (json['albums']['items'] as List)
        .map((e) => SpotifyAlbum.fromJson(e))
        .toList();
    return data;
  }

  static Future<List<SpotifyTracklist>> getTracklistbyAlbumId(
      token, albumId) async {
    var url = Uri.parse(
        "${Const.BASE_URL}albums/${albumId}/tracks?offset=0&limit=50");
    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    List<SpotifyTracklist> data = [];
    print(token);
    var json = jsonDecode(response.body);
    print(json);
    data = (json['items'] as List)
        .map((e) => SpotifyTracklist.fromJson(e))
        .toList();
    return data;
  }
}
