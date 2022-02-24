import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';

import '../colors.dart';
import '../components/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            imageRow(),
            SizedBox(
              height: 3.h,
            ),
            allPost(0),
            allPost(1),
            allPost(2),
            allPost(3),
            allPost(4),
          ],
        ),
      ),
    );
  }

  Padding allPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          userPostImage(index),
          SizedBox(
            height: 1.5.h,
          ),
          userInfosRow(index),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  Container userPostImage(int index) {
    return Container(
      width: 100.w,
      height: 31.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          image: DecorationImage(
              image: NetworkImage(imageUrls[index]), fit: BoxFit.cover)),
    );
  }

  Row userInfosRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        userImage(index),
        userNameColumn(),
        eyeRow(),
        iconsRow(),
      ],
    );
  }

  Row eyeRow() {
    return Row(
      children: [
        Icon(
          CupertinoIcons.eye_fill,
          color: grey,
          size: 14.sp,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text("256",
            style: TextStyle(
                fontSize: 12.sp, color: grey, fontWeight: FontWeight.bold))
      ],
    );
  }

  Row iconsRow() {
    return Row(
      children: [
        Icon(
          CupertinoIcons.heart_fill,
          color: grey,
          size: 14.sp,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          "256",
          style: TextStyle(
              fontSize: 12.sp, color: grey, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container userImage(int index) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrls[index]), fit: BoxFit.cover)),
    );
  }

  Column userNameColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Maria Thomson",
            style: TextStyle(color: titleColor, fontSize: 12.sp)),
        Text("4 minutes ago", style: TextStyle(color: grey, fontSize: 10.sp)),
      ],
    );
  }

  SingleChildScrollView imageRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: SizedBox(
          height: 11.6.h,
          child: Row(
              children: List.generate(
            imageUrls.length,
            (index) => rowProfile(index),
          )),
        ),
      ),
    );
  }

  Widget rowProfile(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Column(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imageUrls[index]), fit: BoxFit.cover)),
          ),
          const Spacer(),
          Text(
            imageNames[index],
            style: TextStyle(fontSize: 12.sp, color: grey),
          )
        ],
      ),
    );
  }

  AppBar barApp() {
    return AppBar(
      elevation: 0,
      backgroundColor: backApp,
      leading: const Icon(
        Icons.menu,
        color: grey,
      ),
      actions: [
        const Icon(
          CupertinoIcons.heart_fill,
          color: grey,
        ),
        SizedBox(
          width: 4.w,
        ),
        const Icon(
          Icons.search,
          color: grey,
        ),
        SizedBox(
          width: 4.w,
        ),
      ],
      title: Text(
        "Feed",
        style: TextStyle(color: titleColor, fontSize: 14.sp),
      ),
    );
  }
}
