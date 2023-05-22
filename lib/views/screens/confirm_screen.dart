import 'dart:io';

import 'package:firetap/controllers/upload_video_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songNameController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });

    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final uploadVideoController _uploadVideoController =
      Get.put(uploadVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 3, right: 3),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.4,
                child: VideoPlayer(controller),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: TextField(
                // scrollPadding: EdgeInsets.only(left: 10 ,right: 10),
                controller: _songNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.music_note),
                  hintText: 'Song Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: TextField(
                controller: _captionController,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.captions_bubble),
                  hintText: 'Caption',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                _uploadVideoController.uploadVideo(_songNameController.text,
                    _captionController.text, widget.videoPath);
              },
              child: Text('Share'),
            ),
          ],
        ),
      ),
    ));
  }
}
