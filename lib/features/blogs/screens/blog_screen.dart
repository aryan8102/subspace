import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:subspace/common_widgets.dart';
import 'package:subspace/features/blogs/providers/blogs_provider.dart';
import 'package:subspace/features/blogs/screens/blog_detail_screen.dart';
import 'package:subspace/features/blogs/widgets/blog_listtile.dart';
import 'package:subspace/features/blogs/widgets/trending_carousel.dart';
import 'package:subspace/global_variables.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final searchController = TextEditingController();
  var selectedCategoryIndex = 0;
  bool _isInit = false;
  // bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isInit = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blogsProvider = Provider.of<BlogsProvider>(context);
    if (_isInit) {
      blogsProvider.fetchBlogs();
      _isInit = false;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none_rounded),
                    )
                  ],
                ),
                verticalSpace(14.h),
                Container(
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: GlobalVariables.textFieldColor,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Icon(Icons.search),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                        )),
                  ),
                ),
                verticalSpace(8.h),
                SizedBox(
                  height: 25.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = i;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                              color: selectedCategoryIndex == i
                                  ? Colors.black
                                  : GlobalVariables.textFieldColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Text(
                            blogsProvider.categories[i],
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: selectedCategoryIndex == i
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      );
                    },
                    itemCount: blogsProvider.categories.length,
                    separatorBuilder: (context, index) => horizontalSpace(4.w),
                  ),
                ),
                verticalSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: GlobalVariables.secondaryTextColor),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: GlobalVariables.secondaryTextColor,
                        )
                      ],
                    ),
                  ],
                ),
                verticalSpace(16.h),
                blogsProvider.blogs.isEmpty
                    ? SizedBox(
                        width: 320.w,
                        height: 170.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : TrendingCarousel(blogs: blogsProvider.blogs),
                verticalSpace(22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: GlobalVariables.secondaryTextColor),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: GlobalVariables.secondaryTextColor,
                        )
                      ],
                    ),
                  ],
                ),
                blogsProvider.blogs.isEmpty
                    ? SizedBox(
                        width: 320.w,
                        height: 170.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          var intValue = Random().nextInt(7);
                          var category = blogsProvider.categories[intValue];
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlogDetailScreen(
                                          blog: blogsProvider.blogs[i],
                                        )));
                              },
                              child: BlogListTile(
                                blog: blogsProvider.blogs[i],
                                category: category,
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return verticalSpace(16.h);
                        },
                        itemCount: blogsProvider.blogs.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
