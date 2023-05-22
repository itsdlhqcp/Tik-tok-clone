import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firetap/const.dart';
import 'package:firetap/models/video.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class uploadVideoController {
  //function to compress the video
  _compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }

  ///uploading vedeo to storage

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) {
    final thumbnail = VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage('videos $len', videoPath);
      String thumpnail = await _uploadImageToStorage('videos $len', videoPath);

      Video video = Video(
          username: (userDoc.data() as Map<String, dynamic>)['name'],
          uid: uid,
          id: 'video $len',
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumpnail,
          profilePhoto:
              (userDoc.data() as Map<String, dynamic>)['profilePhoto']);

      await firestore
          .collection('videos')
          .doc('videos $len')
          .set(video.toJson());

      Get.back();
    } catch (e) {
      Get.snackbar('Error in video uploading', e.toString());
    }
  }
}
