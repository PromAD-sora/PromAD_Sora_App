import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/screen/bottom/home/home.dart';
import 'package:promad_sora/screen/bottom/menu.dart';
import 'package:promad_sora/screen/bottom/profile.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _HomePageState();
}

class _HomePageState extends State<Bottom> {
  int selected = 0; // 초기 선택된 탭 인덱스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: null,
      extendBody: true,
      bottomNavigationBar: bottombar(),
      body: SafeArea(
        child: Stack(
          children: [
            pageView(const Home(), 0),
            pageView(const Menu(), 1),
            pageView(const Profile(), 2),
          ],
        ),
      ),
    );
  }

  Widget pageView(Widget child, int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 450),
      opacity: selected == index ? 1 : 0,
      child: IgnorePointer(
        ignoring: selected != index,
        child: child,
      ),
    );
  }

  Theme bottombar() {
    return Theme(
      data: ThemeData(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 0.2.w,
                color: const Color.fromARGB(255, 79, 79, 79)), // 흰색 테두리 추가
          ),
        ),
        child: StylishBottomBar(
          backgroundColor: backgroundColor,
          items: [
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(CupertinoIcons.house_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(CupertinoIcons.house_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(
                      CupertinoIcons.square_list_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(
                      CupertinoIcons.square_list_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Tools',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 1
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(CupertinoIcons.profile_circled.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(CupertinoIcons.profile_circled.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 2
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
          ],
          option: AnimatedBarOptions(
            iconSize: 23.h,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.Default,
            opacity: 0.3,
          ),
          currentIndex: selected,
          hasNotch: true,
          onTap: (index) {
            setState(() {
              selected = index;
            });
          },
        ),
      ),
    );
  }
}
