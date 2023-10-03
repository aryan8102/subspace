// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subspace/features/blogs/widgets/author_detail.dart';

import 'package:subspace/models/blog.dart';

import '../../../common_widgets.dart';

class BlogListTile extends StatelessWidget {
  final Blog blog;
  final String category;
  const BlogListTile({
    Key? key,
    required this.blog,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(blog.imgUrl),
                    fit: BoxFit.cover)),
          ),
          horizontalSpace(8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(fontSize: 10.sp, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                width: 220.w,
                height: 30.h,
                child: Text(
                  blog.title,
                  style: TextStyle(fontSize: 12.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpace(8.h),
              const AuthorDetail(
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
