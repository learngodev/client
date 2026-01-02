import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StudentVideoPlayerPage extends StatefulWidget {
  const StudentVideoPlayerPage({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  State<StudentVideoPlayerPage> createState() => _StudentVideoPlayerPageState();
}

class _StudentVideoPlayerPageState extends State<StudentVideoPlayerPage> {
  VideoPlayerController? _controller;
  Object? _initError;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final uri = Uri.tryParse(widget.url);
    if (uri == null) {
      setState(() => _initError = '视频地址无效');
      return;
    }

    final controller = VideoPlayerController.networkUrl(uri);
    setState(() => _controller = controller);

    try {
      await controller.initialize();
      if (!mounted) return;
      await controller.play();
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      setState(() => _initError = e);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title.isEmpty ? '视频播放' : widget.title)),
      body: _initError != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('无法播放视频：$_initError'),
              ),
            )
          : controller == null
          ? const Center(child: CircularProgressIndicator())
          : controller.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(controller),
                      _ControlsOverlay(controller: controller),
                      VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(_format(controller.value.position)),
                      const Spacer(),
                      Text(_format(controller.value.duration)),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: controller.value.isPlaying
          ? const SizedBox.shrink()
          : Container(
              color: Colors.black26,
              child: Center(
                child: IconButton(
                  iconSize: 56,
                  color: Colors.white,
                  icon: const Icon(Icons.play_arrow),
                  onPressed: controller.play,
                ),
              ),
            ),
    );
  }
}

String _format(Duration value) {
  final totalSeconds = value.inSeconds.clamp(0, 24 * 60 * 60);
  final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
