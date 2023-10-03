import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subspace/common_widgets.dart';
import 'package:subspace/features/blogs/widgets/author_detail.dart';
import 'package:subspace/global_variables.dart';
import 'package:subspace/models/blog.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;
  const BlogDetailScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_left),
                        Text(
                          "Back",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: GlobalVariables.secondaryTextColor,
                  )
                ],
              ),
              verticalSpace(15.h),
              Text(
                blog.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AuthorDetail(color: Colors.black),
                  Container(
                    width: 75.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Follow",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              verticalSpace(16.h),
              Container(
                width: double.infinity,
                height: 140.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(blog.imgUrl),
                      fit: BoxFit.cover,
                    )),
              ),
              verticalSpace(12.h),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "In the ever-evolving landscape of technology, a groundbreaking revolution is underway, poised to redefine the very fabric of computing as we know it. Quantum technology, with its ability to leverage the principles of quantum mechanics, is on the verge of ushering in a new era of computational power. Unlike classical computers that rely on bits to process information, quantum computers use qubits, which can exist in multiple states simultaneously, enabling them to perform complex calculations at unparalleled speeds.\nThe potential applications of quantum computing are vast, ranging from solving complex optimization problems to simulating quantum systems for scientific research. Companies like IBM, Google, and Rigetti Computing are at the forefront of this quantum race, striving to build more stable and scalable quantum processors. As the technology matures, we can anticipate quantum computers to tackle challenges that were once considered insurmountable, propelling us into a future where computing capabilities transcend the boundaries of classical constraints. The quantum leap in technology is not just an incremental advancement; it's a paradigm shift that promises to reshape industries and unlock new possibilities across various fields.",
                  style: TextStyle(fontSize: 12.sp),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
