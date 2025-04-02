// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';

class YtAndVimeoWebViewPlayer extends StatefulWidget {
  const YtAndVimeoWebViewPlayer({
    Key? key,
    this.width,
    this.height,
    this.videoUrl,
    this.accessTokenVimeo,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? videoUrl;
  final String? accessTokenVimeo;

  @override
  _YtAndVimeoWebViewPlayerState createState() =>
      _YtAndVimeoWebViewPlayerState();
}

class _YtAndVimeoWebViewPlayerState extends State<YtAndVimeoWebViewPlayer> {
  late String embedUrl = ''; // Initialize with an empty string

  @override
  void initState() {
    super.initState();
    analyzeVideoUrl(widget.videoUrl!);
  }

  Future<void> analyzeVideoUrl(String videoUrl) async {
    if (videoUrl.contains('youtube.com') || videoUrl.contains('youtu.be')) {
      // YouTube video
      final videoId = extractYouTubeVideoId(videoUrl);
      embedUrl = 'https://www.youtube.com/embed/$videoId?autoplay=1';
    } else if (videoUrl.contains('vimeo.com')) {
      // Vimeo video
      final videoId = extractVimeoVideoId(videoUrl);
      final vimeoEmbedUrl =
          await getVimeoEmbedHtml(videoId, widget.accessTokenVimeo!);
      embedUrl = vimeoEmbedUrl + '?autoplay=1&muted=0';
    }

    if (mounted) {
      setState(() {});
    }
  }

  String extractYouTubeVideoId(String youtubeUrl) {
    final regExp1 = RegExp(r'youtu\.be/([a-zA-Z0-9_-]+)');
    final regExp2 = RegExp(r'v=([a-zA-Z0-9_-]+)');
    final regExp3 = RegExp(r'youtu\.be/([a-zA-Z0-9_-]+)\?');

    final match1 = regExp1.firstMatch(youtubeUrl);
    final match2 = regExp2.firstMatch(youtubeUrl);
    final match3 = regExp3.firstMatch(youtubeUrl);

    if (match1 != null && match1.groupCount >= 1) {
      return match1.group(1)!;
    } else if (match2 != null && match2.groupCount >= 1) {
      return match2.group(1)!;
    } else if (match3 != null && match3.groupCount >= 1) {
      return match3.group(1)!;
    }

    throw Exception('Failed to extract YouTube video ID');
  }

  String extractVimeoVideoId(String vimeoUrl) {
    final regExp = RegExp(r'/(\d+)');
    final match = regExp.firstMatch(vimeoUrl);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    }
    throw Exception('Failed to extract Vimeo video ID');
  }

  Future<String> getVimeoEmbedHtml(String videoId, String accessToken) async {
    final url = 'https://api.vimeo.com/videos/$videoId';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData != null &&
          jsonData.containsKey('embed') &&
          jsonData['embed'].containsKey('html')) {
        final embedHtml = jsonData['player_embed_url'];
        print('this is vimeo embed url = $embedHtml');
        return embedHtml;
      } else {
        throw Exception(
            'Vimeo API response does not contain the expected data structure.');
      }
    } else {
      throw Exception(
          'Failed to fetch Vimeo embed HTML. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only create and load the InAppWebView when embedUrl is not empty
    if (embedUrl.isNotEmpty) {
      return InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(embedUrl), // Use WebUri instead of Url or Uri
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
            javaScriptEnabled: true,
          ),
        ),
        onLoadError: (controller, url, code, message) {
          print('WebView Error - URL: $url, Code: $code, Message: $message');
        },
      );
    } else {
      // Return a placeholder or loading indicator if embedUrl is empty
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black, // Background color
          valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFFEBA317)), // Progress color
        ),
      );
    }
  }
}
