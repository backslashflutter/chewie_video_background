import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // initializing video player
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset("assets/boy.mp4");

  ChewieController? chewieController;

  // init State
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 9 / 20,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Expanded(
              child: Chewie(
            controller: chewieController!,
          )),
          Container(color: Colors.black54),
          Positioned(
            top: 70,
            left: 10,
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'FLUTTER\nFIREBASE\nJAVASCRIPT\nREACT'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 0.2,
                      height: 1.2,
                    ),
                  ),
                  const Text(
                    'Please log in to\nenter a new world\nof opportunities',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                      letterSpacing: 0.2,
                      wordSpacing: 0.2,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Become a programmer',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
