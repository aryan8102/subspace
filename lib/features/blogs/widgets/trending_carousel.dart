// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subspace/common_widgets.dart';
import 'package:subspace/features/blogs/widgets/author_detail.dart';

import '../../../models/blog.dart';

class TrendingCarousel extends StatefulWidget {
  final List<Blog> blogs;
  const TrendingCarousel({
    Key? key,
    required this.blogs,
  }) : super(key: key);

  @override
  State<TrendingCarousel> createState() => _TrendingCarouselState();
}

class _TrendingCarouselState extends State<TrendingCarousel> {
  int _current = 0;
  List<int> indicators = [0, 1, 2];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: 3,
          itemBuilder: (BuildContext ctx, int itemIndex, int pageViewIndex) {
            return Container(
              // width: 320.w,
              // height: 170.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.blogs[itemIndex].imgUrl,
                    ),
                    fit: BoxFit.cover,
                  )),
              child: Container(
                padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.blogs[itemIndex].title,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                    verticalSpace(8.h),
                    const AuthorDetail(
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
              aspectRatio: 320 / 170,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
