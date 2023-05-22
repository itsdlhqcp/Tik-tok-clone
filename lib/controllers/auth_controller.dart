
import 'dart:io' ;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firetap/const.dart';

// import 'package:flutter/cupertino.dart';
import 'package:firetap/models/user.dart' as model;
import 'package:firetap/views/screens/auth/login_screen.dart';
import 'package:firetap/views/screens/home_screen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //fuctio to pickimage from gallery
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;

  File? get profilePhoto => _pickedImage.value;
   @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialState);
  }

  _setInitialState(User? user) {
    if (user != null) {
      Get.offAll(HomeScreen());
    } else {
      
      Get.offAll(LoginScreen());
    }
  }
  
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Nice');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }
  //upload picked image to storage

  Future<String> uploadImageToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //register users
  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save the user to auth and to firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await uploadImageToStorage(image);

        model.User user = model.User(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error Occured', 'Please enter all fields');
      }
    } catch (e) {
      Get.snackbar('Error has occured', e.toString());
    }
  }
  //Function to login User

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('logged in already');
        Get.offAll(HomeScreen());
      } else {
        Get.snackbar('Error logging in', 'Please enter all fields');
      }
    } catch (e) {
      Get.snackbar('Error logging in', e.toString());
    }
  }
}


