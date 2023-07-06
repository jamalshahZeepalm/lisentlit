// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/general_widgets/chip_card.dart';
import 'package:listenlit/model/book_model.dart';
import 'package:listenlit/model/chip_model.dart';
import 'package:listenlit/model/mylibrary_model.dart';
import 'package:listenlit/model/usermodel.dart';
import 'package:listenlit/pages/exploreScreen/detail_screen.dart';
import 'package:listenlit/pages/libraryScreen/library_bookcard_widget.dart';
import 'package:listenlit/utils/colors.dart';
import 'package:listenlit/utils/icons_path.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  int onSelect = 0;
  List<BookModel> get savedBooksList => currentUser.savedBooks
      .map((savedId) =>
          bookModelList.firstWhere((element) => element.bookId == savedId))
      .toList();

  List<BookModel> get inProgressList => currentUser.readingProgress.keys
      .map((savedId) =>
          bookModelList.firstWhere((element) => element.bookId == savedId))
      .toList();
  List<BookModel> get completedList => currentUser.readingProgress.values
      .map((bookProgressModel) => bookModelList
          .firstWhere((element) => element.bookId == bookProgressModel.bookId))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h, left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Library',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kWhiteColor,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SvgPicture.asset(
                  AppIcons.kLinearLine,
                  width: 112.w,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                myLibraryChipList.length,
                (index) => ChipCard(
                  chipModel: myLibraryChipList[index],
                  onPressed: () {
                    setState(() {
                      onSelect = index;
                    });
                  },
                  backgroundColor:
                      onSelect == index ? AppColor.kPrimary : AppColor.kBGColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, right: 16.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.52, // Adjust this value as needed
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: getListBySelectedChip().length,
                itemBuilder: (context, index) {
                  BookModel libraryModel = getListBySelectedChip()[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => BookDetailScreen(bookModel: libraryModel));
                    },
                    child: LibraryBookCardWidget(
                      book: libraryModel,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<BookModel> getListBySelectedChip() {
    if (onSelect == 0) {
      return savedBooksList;
    } else if (onSelect == 1) {
      return inProgressList;
    } else if (onSelect == 2) {
      return completedList;
    } else {
      return []; // Return an empty list if the index is invalid
    }
  }
}
