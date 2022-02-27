import 'package:breake/ui/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:sizer/sizer.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController t1 = TextEditingController();

  final List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: titleAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchBox(),
              SizedBox(
                height: 4.h,
              ),
              allPost(0),
              SizedBox(
                height: 4.h,
              ),
              allPost(1),
              SizedBox(
                height: 4.h,
              ),
              allPost(2),
              SizedBox(
                height: 4.h,
              ),
              allPost(3),
              SizedBox(
                height: 4.h,
              ),
              popularTitle(),
              SizedBox(
                height: 2.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        _images.length,
                        (index) => Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 5.w, right: 1.w, bottom: 1.h),
                                  width: 41.w,
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.w),
                                      image: DecorationImage(
                                          image: NetworkImage(_images[index]),
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black38, BlendMode.darken),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  bottom: 2.5.h,
                                  left: 7.w,
                                  child: Text(
                                    imageNames[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding popularTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Popular destinations",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
      ),
    );
  }

  Padding allPost(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          postRow(),
          SizedBox(
            height: 0.3.h,
          ),
          Stack(children: [
            backStackContainer(),
            postImage(index),
            seven(),
            dayTrip(),
            bali(),
            onTrip(),
            imageList(),
            join(),
            subtitle(),
            divider(),
            iconRows()
          ]),
        ],
      ),
    );
  }

  Positioned divider() {
    return Positioned.fill(
        bottom: 7.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF777777), width: 0.3),
              ),
            ),
          ),
        ));
  }

  Positioned subtitle() {
    return Positioned(
      top: 33.h,
      left: 5.w,
      child: SizedBox(
        width: 80.w,
        height: 5.h,
        child: Text(
          "On a trip to America, looking for someone to"
          "join me on this epic journey through American",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 12.sp, color: const Color(0xFF777777)),
        ),
      ),
    );
  }

  Positioned iconRows() {
    return Positioned(
      bottom: 2.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
            SizedBox(
              width: 7.w,
            ),
            const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
            SizedBox(
              width: 58.w,
            ),
            const Icon(
              Icons.bookmark,
              color: Color(0xFF777777),
            )
          ],
        ),
      ),
    );
  }

  Positioned join() {
    return Positioned(
      top: 26.4.h,
      left: 35.w,
      child: Container(
        width: 18.w,
        height: 4.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(5.w)),
        child: const Text(
          "JOIN",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Positioned imageList() {
    return Positioned(
      top: 1.3.h,
      right: 1.w,
      child: FlutterImageStack(
        imageList: _images,
        showTotalCount: true,
        totalCount: 4,
        itemRadius: 7.w, // Radius of each images
        itemCount: 2, // Maximum number of images to be shown in stack
        itemBorderWidth: 1, // Border width around the images
      ),
    );
  }

  Positioned onTrip() {
    return Positioned(
      top: 24.h,
      right: 7.w,
      child: Text(
        "ON TRİP",
        style: TextStyle(
            color: Color(0xFFFFDD00),
            fontWeight: FontWeight.bold,
            fontSize: 15.sp),
      ),
    );
  }

  Positioned bali() {
    return Positioned(
      top: 24.h,
      left: 7.w,
      child: Text(
        "Bali",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
      ),
    );
  }

  Positioned dayTrip() {
    return Positioned(
      top: 2.3.h,
      left: 23.w,
      child: Text(
        "day trip",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
      ),
    );
  }

  Positioned seven() {
    return Positioned(
      top: 2.h,
      left: 7.w,
      child: Container(
        width: 12.w,
        height: 3.4.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.w)),
        child: Text(
          "7",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
        ),
      ),
    );
  }

  Positioned postImage(index) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: 100.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          image: DecorationImage(
              image: NetworkImage(imageUrls[index]),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)),
        ),
      ),
    );
  }

  Container backStackContainer() {
    return Container(
      width: 100.w,
      height: 47.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 2,
            )
          ]),
    );
  }

  Widget postRow() {
    return Container(
      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imageUrls[0]), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "Jennifer",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
          ),
          const Spacer(),
          Text(
            "2 hours ago",
            style: TextStyle(color: Color(0xFF9F9F9F), fontSize: 9.sp),
          ),
        ],
      ),
    );
  }

  Padding searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Container(
        padding: EdgeInsets.only(left: 3.w),
        width: 100.w,
        height: 5.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.w),
            border: Border.all(
              width: 0.4,
              color: Colors.grey,
            )),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: t1,
          decoration: InputDecoration(
              hintText: "Enter a name of a city you're traveling to",
              hintStyle:
                  TextStyle(color: const Color(0xFF9F9F9F), fontSize: 12.sp),
              isDense: true,
              border: InputBorder.none),
        ),
      ),
    );
  }

  AppBar titleAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Traveling To?",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Icon(
            Icons.search_outlined,
            size: 18.sp,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
