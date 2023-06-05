import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music_mate/models/spotify_tracklist/artist.dart';
import 'package:flutter_music_mate/models/spotify_tracklist/spotify_tracklist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/crossfade_state.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/player_context.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import '../../shared/shared.dart';
import '../widgets/widgets.dart';
import '../../services/services.dart';
import '../../models/models.dart';

part 'splash.dart';
part 'login.dart';
part 'menu.dart';
part 'home.dart';
part 'playlist.dart';
part 'setting.dart';
part 'player.dart';
part 'tracklist.dart';
part 'register.dart';
part 'signup.dart';
