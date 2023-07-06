import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/general_widgets/postcard_widget.dart';
import 'package:listenlit/general_widgets/rowtext_showbutton_widget.dart';
import 'package:listenlit/model/book_model.dart';
import 'package:listenlit/model/chip_model.dart';
import 'package:listenlit/model/usermodel.dart';
import 'package:listenlit/pages/exploreScreen/detail_screen.dart';
import 'package:listenlit/pages/homeScreen/widgets/book_nowcard.dart';
import 'package:listenlit/general_widgets/chip_card.dart';
import 'package:listenlit/pages/homeScreen/widgets/storycard_widget.dart';
import 'package:listenlit/pages/homeScreen/widgets/toplevel_appbar_widget.dart';
import 'package:listenlit/pages/profileScreen/profile_screen.dart';
import 'package:listenlit/utils/colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int onSelect = 0;
  bool isReadShowMore = false;
  bool isTrendingShowMore = false;
  int trendDisplayCount = 4;
  int isReadDisplayCount = 4;
  List<BookModel> fiveMintsList =
      bookModelList.where((element) => element.listenTime == '5').toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 66.h),
      child: Column(
        children: [
          TopLevelAppBar(onPressed: () {
            Get.to(() => const ProfileScreen());
          }),
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: SizedBox(
              height: 100.h,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                  userStoryList.length,
                  (index) => StoryCardWidget(
                    userModel: userStoryList[index],
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                chipList.length,
                (index) => ChipCard(
                  chipModel: chipList[index],
                  onPressed: () {
                    setState(() {
                      onSelect = index;
                    });
                  },
                  backgroundColor: onSelect == index
                      ? AppColor.kPrimary
                      : AppColor.kBlackColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    const BookNowCard(),
                    Padding(
                      padding: EdgeInsets.only(right: 16.w, top: 24.h),
                      child: RowTextShowButton(
                        title: ' Trending',
                        textButtonText:
                            isTrendingShowMore ? 'Hide all' : 'Show all',
                        onPressed: () {
                          setState(() {
                            isTrendingShowMore = !isTrendingShowMore;
                            showTrendingPost();
                            if (kDebugMode) {
                              print(isTrendingShowMore);
                            }
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        height: 250.h,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: List.generate(
                            trendDisplayCount,
                            (index) => GestureDetector(
                              onTap: () {
                                Get.to(() => BookDetailScreen(
                                    bookModel: fiveMintsList[index]));
                              },
                              child: PostCardWidget(
                                  trendingModel: bookModelList[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.w, top: 24.h),
                      child: RowTextShowButton(
                          title: ' 5-Minutes read',
                          textButtonText:
                              isReadShowMore ? 'Hide all' : 'Show all',
                          onPressed: () {
                            setState(() {
                              isReadShowMore = !isReadShowMore;
                              showTrendingPost();
                              if (kDebugMode) {
                                print(isReadShowMore);
                              }
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: SizedBox(
                        height: 250.h,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: List.generate(
                            fiveMintsList.length,
                            (index) => GestureDetector(
                              onTap: () {
                                Get.to(() => BookDetailScreen(
                                    bookModel: fiveMintsList[index]));
                              },
                              child: PostCardWidget(
                                  trendingModel: fiveMintsList[index]),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showTrendingPost() {
    trendDisplayCount = isTrendingShowMore ? bookModelList.length : 4;
  }

  showReadPost() {
    isReadDisplayCount = isReadShowMore ? bookModelList.length : 4;
  }
}
