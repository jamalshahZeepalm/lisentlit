import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/general_widgets/postcard_widget.dart';
import 'package:listenlit/general_widgets/rowtext_showbutton_widget.dart';
import 'package:listenlit/model/book_model.dart';
import 'package:listenlit/model/usermodel.dart';
import 'package:listenlit/pages/exploreScreen/widgets/bookdescription_column.dart';
import 'package:listenlit/pages/exploreScreen/widgets/chapterlist_container.dart';
import 'package:listenlit/pages/exploreScreen/widgets/taglist_container.dart';
import 'package:listenlit/pages/exploreScreen/widgets/user_profilecard_container.dart';
import 'package:listenlit/utils/colors.dart';
import 'package:listenlit/utils/icons_path.dart';
import 'package:listenlit/utils/images_paths.dart';

class BookDetailsContainer extends StatefulWidget {
  final BookModel bookModel;
  const BookDetailsContainer({super.key, required this.bookModel});

  @override
  State<BookDetailsContainer> createState() => _BookDetailsContainerState();
}

class _BookDetailsContainerState extends State<BookDetailsContainer> {
  bool isSave = false;
  bool isReadShowMore = false;
  int similarBooksCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 321.82.h),
      padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.bookModel.description,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: AppColor.kWhiteColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: 20.h),
                    onPressed: () {
                      setState(() {
                        isSave = !isSave;
                      });
                    },
                    icon: Icon(
                      Icons.bookmark_border_outlined,
                      color: isSave ? AppColor.kPrimary : null,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Row(
                children: [
                  Text(
                    'Kory Bogon, Suzette Baltimore, and James wood',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: AppColor.kWhiteColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                children: [
                  Text(
                    widget.bookModel.bookName,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Gotham',
                        color: AppColor.kWhiteColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
              ),
              child: Container(
                height: 38.h,
                decoration: BoxDecoration(
                    color: AppColor.kDarkBlue,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 44.w),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColor.kLightAccentColor,
                          ),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.kUilClock),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              '18 min',
                              style: TextStyle(
                                color: AppColor.kWhiteColor,
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ])),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 40.5.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcons.kBulb,
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            '6 key ideas',
                            style: TextStyle(
                              color: AppColor.kWhiteColor,
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            const BookDescriptionColumn(),
            SizedBox(
              height: 16.h,
            ),
            TagListContainer(bookModel: widget.bookModel),
            SizedBox(
              height: 30.h,
            ),
            ChapterListContainer(bookModel: widget.bookModel),
            SizedBox(
              height: 22.h,
            ),
            const UserProfileContainer(),
            SizedBox(
              height: 32.h,
            ),
            RowTextShowButton(
                title: 'Similar Books',
                textButtonText: isReadShowMore ? 'Hide all' : 'Show all',
                onPressed: () {
                  setState(() {
                    isReadShowMore = !isReadShowMore;
                    showTrendingPost();
                    if (kDebugMode) {
                      print(isReadShowMore);
                    }
                  });
                }),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: SizedBox(
                height: 250.h,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: List.generate(
                    bookModelList.length,
                    (index) =>
                        PostCardWidget(trendingModel: bookModelList[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }

  showTrendingPost() {
    similarBooksCount = isReadShowMore ? bookModelList.length : 4;
  }
}
