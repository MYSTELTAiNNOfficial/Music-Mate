part of 'models.dart';

class SpotifyBearer extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? error;
  final String? errorDescription;

  const SpotifyBearer({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.error,
    this.errorDescription,
  });

  factory SpotifyBearer.fromMap(Map<String, dynamic> data) => SpotifyBearer(
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
        expiresIn: data['expires_in'] as int?,
        error: data['error'] as String?,
        errorDescription: data['error_description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
        'error': error,
        'error_description': errorDescription,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpotifyBearer].
  factory SpotifyBearer.fromJson(String data) {
    return SpotifyBearer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpotifyBearer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accessToken,
      tokenType,
      expiresIn,
      error,
      errorDescription,
    ];
  }
}
