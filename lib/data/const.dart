import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listenlit/pages/exploreScreen/explore_screen.dart';
import 'package:listenlit/pages/homeScreen/dashboard_screen.dart';
import 'package:listenlit/pages/libraryScreen/mylibrary_screen.dart';

List<Widget> pages = [
  DashBoardScreen(),
  ExploreScreen(),
  const MyLibraryScreen(),
];
