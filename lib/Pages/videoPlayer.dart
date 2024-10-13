import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter/services.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoPath;
  final String title;

  const FullScreenVideoPlayer({Key? key, required this.videoPath, required this.title}) : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  bool _isControlsVisible = true;
  Timer? _hideControlsTimer;

  ValueNotifier<double> _progressNotifier = ValueNotifier(0.0);
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          WakelockPlus.enable();
        });
        _startHideControlsTimer();
      });

    _controller.addListener(() {
      _progressNotifier.value = _controller.value.position.inSeconds.toDouble();
      if (!_controller.value.isPlaying && _controller.value.position >= _controller.value.duration) {
        setState(() {
          _isPlaying = false;
          WakelockPlus.disable();
        });
      }
    });

    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    _controller.dispose();
    WakelockPlus.disable();
    _hideControlsTimer?.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
        WakelockPlus.disable();
      } else {
        _controller.play();
        _isPlaying = true;
        WakelockPlus.enable();
      }
      _resetHideControlsTimer();
    });
  }

  void _toggleControlsVisibility() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
      if (_isControlsVisible) {
        _resetHideControlsTimer();
      } else {
        _hideControlsTimer?.cancel();
      }
    });
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isControlsVisible = false;
        });
      }
    });
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _startHideControlsTimer();
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
    _resetHideControlsTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: _toggleControlsVisibility,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              if (_isControlsVisible)
                Container(
                  color: Colors.black.withOpacity(0.7), // Dim the video
                ),
              if (_isControlsVisible)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    elevation: 0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                        child: DropdownButton<double>(
                          dropdownColor: Colors.black,
                          value: _playbackSpeed,
                          icon: const Icon(Icons.speed, color: Colors.white),
                          items: const [
                            DropdownMenuItem(value: 0.5, child: Text("0.5x", style: TextStyle(color: Colors.white))),
                            DropdownMenuItem(value: 1.0, child: Text("1.0x", style: TextStyle(color: Colors.white))),
                            DropdownMenuItem(value: 1.5, child: Text("1.5x", style: TextStyle(color: Colors.white))),
                            DropdownMenuItem(value: 2.0, child: Text("2.0x", style: TextStyle(color: Colors.white))),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              _changePlaybackSpeed(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (_isControlsVisible)
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Backward Button
                          IconButton(
                            icon: const Icon(Icons.replay_10, color: Colors.white, size: 40),
                            onPressed: () {
                              _controller.seekTo(_controller.value.position - const Duration(seconds: 10));
                              _resetHideControlsTimer();
                            },
                          ),
                          const SizedBox(width: 50), // Increased space between buttons
                          // Play/Pause Button
                          IconButton(
                            icon: Icon(
                              _isPlaying ? CupertinoIcons.pause_circle : CupertinoIcons.play_arrow,
                              color: Colors.white,
                              size: 60,
                            ),
                            onPressed: _togglePlayPause,
                          ),
                          const SizedBox(width: 50), // Increased space between buttons
                          // Forward Button
                          IconButton(
                            icon: const Icon(Icons.forward_10, color: Colors.white, size: 40),
                            onPressed: () {
                              _controller.seekTo(_controller.value.position + const Duration(seconds: 10));
                              _resetHideControlsTimer();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (_isControlsVisible)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ValueListenableBuilder<double>(
                            valueListenable: _progressNotifier,
                            builder: (context, value, child) {
                              return Text(
                                _formatDuration(Duration(seconds: value.toInt())),
                                style: const TextStyle(color: Colors.white),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder<double>(
                            valueListenable: _progressNotifier,
                            builder: (context, value, child) {
                              return Slider(
                                activeColor: Color(0xFF9F0600),
                                inactiveColor: Colors.grey,
                                min: 0,
                                max: _controller.value.duration.inSeconds.toDouble(),
                                value: value,
                                onChanged: (newValue) {
                                  _controller.seekTo(Duration(seconds: newValue.toInt()));
                                  _resetHideControlsTimer();
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            _formatDuration(_controller.value.duration),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
