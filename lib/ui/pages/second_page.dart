import 'package:breake/ui/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> categories = ["Popular", "Latest", "Following"];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topCategories(),
            SizedBox(
              height: 2.h,
            ),
            allPosts(0),
            SizedBox(
              height: 2.h,
            ),
            allPosts(1),
            SizedBox(
              height: 2.h,
            ),
            allPosts(2),
            SizedBox(
              height: 2.h,
            ),
            allPosts(3),
          ],
        ),
      ),
    );
  }

  Stack allPosts(index) {
    return Stack(
      children: [
        bigPost(index),
        postTopInfo(index),
      ],
    );
  }

  Positioned postTopInfo(int index) {
    return Positioned(
        bottom: 2.6.h,
        left: 8.w,
        child: Row(
          children: [
            Container(
              width: 10.6.w,
              height: 10.6.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imageNames[index],
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                Text("16 minutes ago",
                    style: TextStyle(color: grey, fontSize: 11.sp))
              ],
            )
          ],
        ));
  }

  Padding bigPost(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        width: 100.w,
        height: 30.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(3.w),
            image: DecorationImage(
                image: NetworkImage(imageUrls[index]), fit: BoxFit.cover)),
      ),
    );
  }

  Row topCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          categories.length,
          (index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: selectedIndex == index ? titleColor : grey,
                      fontSize: selectedIndex == index ? 21.sp : 18.sp),
                ),
              )),
    );
  }

  AppBar topBar() {
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
