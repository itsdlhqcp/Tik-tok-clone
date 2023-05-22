import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firetap/controllers/auth_controller.dart';
import 'package:firetap/views/screens/add_vedeo_screen.dart';
import 'package:firetap/views/screens/video_screen.dart';
import 'package:flutter/material.dart';

//List of pages
final pages = [
  VideoScreen(),
  
  Text('Search page'),
  AddVideoScreen(),
  Text('Message page'),
  Text('Profile page'),
];

//COLORS
const backgroundColor = Color.fromARGB(255, 0, 0, 0);
var buttonColor = Colors.green[600];
var regColor = Colors.blue[400];
var butColor = Colors.red[600];
//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
//controllers
var authControllers = AuthController.instance;
