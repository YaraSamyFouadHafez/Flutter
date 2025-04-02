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

import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:async';

// Audio packages
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:volume_controller/volume_controller.dart';

// This class will be our background audio handler
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();
  final _playlist = ConcatenatingAudioSource(children: []);

  AudioPlayerHandler() {
    _loadEmptyPlaylist();
    _notifyAudioHandlerAboutPlaybackEvents();
    _listenForDurationChanges();
    _listenForCurrentSongIndexChanges();
    _listenForSequenceStateChanges();
  }

  Future<void> _loadEmptyPlaylist() async {
    try {
      await _player.setAudioSource(_playlist);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  void _listenForDurationChanges() {
    _player.durationStream.listen((duration) {
      var index = _player.currentIndex;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty) return;
      if (index >= newQueue.length) return;
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  void _listenForCurrentSongIndexChanges() {
    _player.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) return;
      if (index >= playlist.length) return;
      mediaItem.add(playlist[index]);
    });
  }

  void _listenForSequenceStateChanges() {
    _player.sequenceStateStream.listen((SequenceState? sequenceState) {
      final sequence = sequenceState?.effectiveSequence;
      if (sequence == null || sequence.isEmpty) return;
      final items = sequence.map((source) => source.tag as MediaItem);
      queue.add(items.toList());
    });
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  Future<void> setAudioSource(String url, MediaItem? mediaItem) async {
    try {
      await _player.stop();
      await _playlist.clear();

      if (mediaItem != null) {
        final audioSource = AudioSource.uri(
          Uri.parse(url),
          tag: mediaItem,
        );
        await _playlist.add(audioSource);
        queue.add([mediaItem]);
        this.mediaItem.add(mediaItem);
      } else {
        final defaultItem = MediaItem(
          id: url,
          album: 'Live Radio',
          title: 'Radio Stream',
          artUri: Uri.parse('https://via.placeholder.com/150'),
        );
        final audioSource = AudioSource.uri(
          Uri.parse(url),
          tag: defaultItem,
        );
        await _playlist.add(audioSource);
        queue.add([defaultItem]);
        this.mediaItem.add(defaultItem);
      }

      await _player.setAudioSource(_playlist);
    } catch (e) {
      print("Error setting audio source: $e");
    }
  }

  AudioPlayer get player => _player;

  Future<void> dispose() async {
    await _player.dispose();
  }
}

class AdvanceMusicPlayer extends StatefulWidget {
  const AdvanceMusicPlayer({
    super.key,
    required this.initialUrl,
    this.width,
    this.height,
    this.playPauseButtonSize,
    this.playPauseFillColor,
    this.playPauseBorderColor,
    this.playPauseBorderWidth,
    this.playPauseBorderRadius,
    this.playPauseIconSize,
    this.playPauseIconColor,
    this.playPauseButtonMarginAll,
    this.playPauseButtonPaddingAll,
    this.sliderContainerColor,
    this.sliderContainerPaddingAll,
    this.sliderContainerBorderRadius,
    this.sliderContainerWidth,
    this.sliderContainerHeight,
    this.sliderContainerMarginAll,
    this.sliderActiveTrackColor,
    this.sliderInactiveTrackColor,
    this.sliderThumbColor,
    this.sliderOverlayColor,
    this.sliderTrackHeight,
    this.sliderThumbRadius,
    this.timerTitleText = 'Sleep Timer',
    this.timerTitleColor,
    this.timerTitleFontSize,
    this.timerTextColor,
    this.timerFontSize,
    this.timerActiveColor,
    this.timerInactiveColor,
    this.switchActiveColor,
    this.switchTrackColor,
    this.tileColor,
    this.tileRadius,
    this.tileContainerColor,
    this.tileContainerMarginAll,
    this.tileContainerPaddingAll,
    this.tileContainerBorderRadius,
    this.tileContainerBorderColor,
    this.tileContainerBorderWidth,
    this.tileContainerWidth,
    this.tileContainerHeight,
    this.timePickerContainerWidth,
    this.timePickerContainerHeight,
    this.stationTitle = 'Radio Stream',
    this.stationAlbum = 'Live Radio',
    this.artworkUrl,
  });

  final String initialUrl;
  final double? width;
  final double? height;

  // Play/Pause
  final double? playPauseButtonSize;
  final Color? playPauseFillColor;
  final Color? playPauseBorderColor;
  final double? playPauseBorderWidth;
  final double? playPauseBorderRadius;
  final double? playPauseIconSize;
  final Color? playPauseIconColor;
  final double? playPauseButtonMarginAll;
  final double? playPauseButtonPaddingAll;

  // Volume Slider
  final Color? sliderContainerColor;
  final double? sliderContainerPaddingAll;
  final double? sliderContainerBorderRadius;
  final double? sliderContainerWidth;
  final double? sliderContainerHeight;
  final double? sliderContainerMarginAll;
  final Color? sliderActiveTrackColor;
  final Color? sliderInactiveTrackColor;
  final Color? sliderThumbColor;
  final Color? sliderOverlayColor;
  final double? sliderTrackHeight;
  final double? sliderThumbRadius;

  // Sleep Timer
  final String timerTitleText;
  final Color? timerTitleColor;
  final double? timerTitleFontSize;
  final Color? timerTextColor;
  final double? timerFontSize;
  final Color? timerActiveColor;
  final Color? timerInactiveColor;
  final Color? switchActiveColor;
  final Color? switchTrackColor;
  final Color? tileColor;
  final double? tileRadius;

  // Container around Timer
  final Color? tileContainerColor;
  final double? tileContainerMarginAll;
  final double? tileContainerPaddingAll;
  final double? tileContainerBorderRadius;
  final Color? tileContainerBorderColor;
  final double? tileContainerBorderWidth;
  final double? tileContainerWidth;
  final double? tileContainerHeight;

  // Time picker popup container
  final double? timePickerContainerWidth;
  final double? timePickerContainerHeight;

  // Media metadata
  final String? stationTitle;
  final String? stationAlbum;
  final String? artworkUrl;

  @override
  State<AdvanceMusicPlayer> createState() => _AdvanceMusicPlayerState();
}

class _AdvanceMusicPlayerState extends State<AdvanceMusicPlayer>
    with WidgetsBindingObserver {
  AudioPlayerHandler? _audioHandler;
  Timer? _countdownTimer;
  Timer? _volumePollingTimer;
  int _remainingSeconds = 0;
  bool _isPlaying = false;
  bool _timerActive = false;
  double _volume = 0.5;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  int _selectedHour = 0;
  int _selectedMinute = 0;

  StreamSubscription<PlaybackState>? _playbackStateSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initAudioService();

    VolumeController().getVolume().then((volume) {
      setState(() {
        _volume = volume;
      });
      _audioHandler?.setVolume(volume);
    });

    _volumePollingTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      final currentVolume = await VolumeController().getVolume();
      if (currentVolume != _volume) {
        setState(() {
          _volume = currentVolume;
        });
        _audioHandler?.setVolume(currentVolume);
      }
    });
  }

  Future<void> _initAudioService() async {
    _audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.myapp.audio',
        androidNotificationChannelName: 'My App Audio',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    );

    _playbackStateSubscription =
        _audioHandler!.playbackState.listen((PlaybackState state) {
      setState(() {
        _isPlaying = state.playing;
        _position = state.position;
      });
      if (!state.playing) {
        _cancelTimer();
      }
    });

    _audioHandler!.mediaItem.listen((MediaItem? mediaItem) {
      if (mediaItem != null) {
        setState(() {
          _duration = mediaItem.duration ?? Duration.zero;
        });
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _volumePollingTimer?.cancel();
    _countdownTimer?.cancel();
    _playbackStateSubscription?.cancel();
    _audioHandler?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused && !_isPlaying) {
      _audioHandler?.stop();
    }
  }

  Future<void> _initializeRadioStream() async {
    await _audioHandler?.stop();

    final String artworkUrl =
        widget.artworkUrl ?? 'https://via.placeholder.com/150';
    final String stationTitle = widget.stationTitle ?? 'Radio Stream';
    final String stationAlbum = widget.stationAlbum ?? 'Live Radio';

    try {
      final mediaItem = MediaItem(
        id: widget.initialUrl,
        album: stationAlbum,
        title: stationTitle,
        artUri: Uri.parse(artworkUrl),
        playable: true,
      );

      await _audioHandler?.setAudioSource(widget.initialUrl, mediaItem);
      await _audioHandler?.setVolume(_volume);
    } catch (e) {
      print('Error initializing audio stream: $e');
      setState(() {
        _isPlaying = false;
      });
    }
  }

  void _showTimePicker(BuildContext context) async {
    final now = TimeOfDay.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        if (child == null) return const SizedBox.shrink();
        return Center(
          child: Container(
            width: widget.timePickerContainerWidth ?? 400,
            height: widget.timePickerContainerHeight,
            child: child,
          ),
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        _selectedHour = pickedTime.hour;
        _selectedMinute = pickedTime.minute;
      });

      final nowDT = DateTime.now();
      final chosen = DateTime(nowDT.year, nowDT.month, nowDT.day,
          pickedTime.hour, pickedTime.minute);
      final target =
          chosen.isAfter(nowDT) ? chosen : chosen.add(const Duration(days: 1));
      final diffSec = target.difference(nowDT).inSeconds;
      _startCountdown(diffSec);
    }
  }

  void _startCountdown(int totalSeconds) {
    _countdownTimer?.cancel();
    setState(() {
      _remainingSeconds = totalSeconds;
      _timerActive = totalSeconds > 0;
    });

    if (_timerActive) {
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          setState(() => _remainingSeconds--);
        } else {
          _stopAudio();
          timer.cancel();
        }
      });
    }
  }

  void _cancelTimer() {
    _countdownTimer?.cancel();
    setState(() {
      _timerActive = false;
      _remainingSeconds = 0;
    });
  }

  String _formatDuration(int seconds) {
    final locale = Localizations.localeOf(context).languageCode.toLowerCase();
    final isArabic = locale.startsWith('ar');
    final hh = (seconds ~/ 3600).toString().padLeft(2, '0');
    final mm = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final ss = (seconds % 60).toString().padLeft(2, '0');
    String text = isArabic ? '$ss:$mm:$hh' : '$hh:$mm:$ss';
    if (isArabic) text = _convertToArabicDigits(text);
    return text;
  }

  String _convertToArabicDigits(String input) {
    const western = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    var result = input;
    for (int i = 0; i < western.length; i++) {
      result = result.replaceAll(western[i], arabic[i]);
    }
    return result;
  }

  void _togglePlayback() async {
    try {
      if (_isPlaying) {
        await _audioHandler?.stop();
        setState(() {
          _isPlaying = false;
          _timerActive = false;
          _remainingSeconds = 0;
        });
      } else {
        if (_audioHandler?.player.processingState == ProcessingState.idle) {
          await _initializeRadioStream();
        }
        await _audioHandler?.play();
      }
    } catch (e) {
      print('Error toggling playback: $e');
      setState(() => _isPlaying = false);
    }
  }

  Future<void> _stopAudio() async {
    await _audioHandler?.stop();
    setState(() {
      _isPlaying = false;
      _timerActive = false;
      _remainingSeconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode.toLowerCase();
    final isArabic = locale.startsWith('ar');

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            // 1) Play/Pause Button
            Container(
              margin: EdgeInsets.all(widget.playPauseButtonMarginAll ?? 16.0),
              padding: EdgeInsets.all(widget.playPauseButtonPaddingAll ?? 8.0),
              child: Container(
                width: widget.playPauseButtonSize ?? 64.0,
                height: widget.playPauseButtonSize ?? 64.0,
                decoration: BoxDecoration(
                  color: widget.playPauseFillColor ?? Colors.blue,
                  borderRadius: BorderRadius.circular(
                      widget.playPauseBorderRadius ?? 32.0),
                  border: Border.all(
                    color: widget.playPauseBorderColor ?? Colors.white,
                    width: widget.playPauseBorderWidth ?? 2.0,
                  ),
                ),
                child: IconButton(
                  iconSize: widget.playPauseIconSize ?? 48.0,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: widget.playPauseIconColor ?? Colors.white,
                  ),
                  onPressed: _togglePlayback,
                ),
              ),
            ),

            // 2) Volume Slider with icons
            Container(
              margin: EdgeInsets.all(widget.sliderContainerMarginAll ?? 16.0),
              width: widget.sliderContainerWidth ?? 300.0,
              height: widget.sliderContainerHeight ?? 80.0,
              padding: EdgeInsets.all(widget.sliderContainerPaddingAll ?? 8.0),
              decoration: BoxDecoration(
                color: widget.sliderContainerColor ?? Colors.grey[200],
                borderRadius: BorderRadius.circular(
                    widget.sliderContainerBorderRadius ?? 12.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.volume_mute),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: widget.sliderTrackHeight ?? 4.0,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius:
                                widget.sliderThumbRadius ?? 10.0),
                        thumbColor: widget.sliderThumbColor ?? Colors.white,
                        activeTrackColor:
                            widget.sliderActiveTrackColor ?? Colors.blue,
                        inactiveTrackColor:
                            widget.sliderInactiveTrackColor ?? Colors.grey,
                        overlayColor: widget.sliderOverlayColor ??
                            Colors.blueAccent.withOpacity(0.1),
                      ),
                      child: Slider(
                        value: _volume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() => _volume = value);
                          _audioHandler?.setVolume(value);
                          VolumeController().setVolume(value);
                        },
                      ),
                    ),
                  ),
                  const Icon(Icons.volume_up),
                ],
              ),
            ),

            // 3) Sleep Timer SwitchListTile
            Container(
              width: widget.tileContainerWidth,
              height: widget.tileContainerHeight,
              margin: EdgeInsets.all(widget.tileContainerMarginAll ?? 0),
              padding: EdgeInsets.all(widget.tileContainerPaddingAll ?? 0),
              decoration: BoxDecoration(
                color: widget.tileContainerColor ??
                    widget.tileColor ??
                    Colors.white,
                borderRadius: BorderRadius.circular(
                    widget.tileContainerBorderRadius ??
                        (widget.tileRadius ?? 12.0)),
                border: widget.tileContainerBorderColor != null &&
                        widget.tileContainerBorderWidth != null
                    ? Border.all(
                        color: widget.tileContainerBorderColor!,
                        width: widget.tileContainerBorderWidth!)
                    : null,
              ),
              child: SwitchListTile.adaptive(
                value: _timerActive,
                onChanged: (bool value) {
                  if (value) {
                    // Immediately update the UI so that the play/pause icon changes.
                    setState(() {
                      _timerActive = true;
                      _isPlaying = true;
                    });
                    // Immediately show the time picker.
                    _showTimePicker(context);
                    // If the actual audio isn't playing, kick off playback asynchronously.
                    if (!(_audioHandler?.player.playing ?? false)) {
                      _initializeRadioStream()
                          .then((_) => _audioHandler?.play());
                    }
                  } else {
                    _cancelTimer();
                  }
                },
                title: Text(
                  widget.timerTitleText,
                  style: TextStyle(
                      fontSize: widget.timerTitleFontSize ?? 16,
                      color: widget.timerTitleColor ?? Colors.grey),
                ),
                subtitle: Text(
                  _timerActive ? _formatDuration(_remainingSeconds) : 'Off',
                  style: TextStyle(
                    fontSize: widget.timerFontSize ?? 24,
                    fontWeight: FontWeight.bold,
                    color: _timerActive
                        ? widget.timerActiveColor ?? Colors.green
                        : widget.timerInactiveColor ?? Colors.grey,
                  ),
                ),
                tileColor: Colors.transparent,
                activeColor: widget.switchActiveColor ?? Colors.blue,
                activeTrackColor: widget.switchTrackColor ?? Colors.grey,
                shape: const RoundedRectangleBorder(),
                secondary: Icon(
                  Icons.timer,
                  color: _timerActive
                      ? widget.timerActiveColor ?? Colors.green
                      : widget.timerInactiveColor ?? Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
