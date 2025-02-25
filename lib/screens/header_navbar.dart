import 'package:literexia/screens/chatbot_screen.dart';
import 'package:literexia/screens/profile_screen.dart';
import 'package:literexia/screens/progress_screen.dart';
import 'package:literexia/widgets/constant.dart';
import 'package:literexia/widgets/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:literexia/screens/home_screen.dart';

class HeaderNavbar extends StatefulWidget {
  const HeaderNavbar({super.key, required List<Map<String, dynamic>> weeklyProgress, required List<Map<String, dynamic>> achievements});

  @override
  State<HeaderNavbar> createState() => _HeaderNavbarState();
}

class _HeaderNavbarState extends State<HeaderNavbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  String _selectedAccessibility = "LARGE TEXT"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: PRIMARY_COLOR,
          elevation: 1,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    _getHeaderTitle(),
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bubblegum',
                      color: BACKGROUND_COLOR,
                      letterSpacing: 6,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      _selectedAccessibility = value; 
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    _buildPopupItem("Large Text", Icons.format_size),
                    _buildPopupItem("Highlight Text", Icons.highlight),
                    _buildPopupItem("Change Font", Icons.font_download),
                    _buildPopupItem("Voice Over", Icons.record_voice_over),
                  ],
                  child: Row(
                    children: [
                      Text(
                        _selectedAccessibility, 
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Bungee',
                          color: BACKGROUND_COLOR,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePageScreen(),
          
       //------FOR PROGRESS MODIFY-------//
          ProgressScreen( weeklyProgress: [], achievements: [],),
      //------FOR PROGRESS MODIFY-------//

          ChatBotScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onTappedBar,
          backgroundColor: PRIMARY_COLOR,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            _buildNavItem("Home", 'assets/icons/Home-inactive.png',
                "assets/icons/Home.png", 0),
            _buildNavItem("Progress", 'assets/icons/Progress.png',
                'assets/icons/Progress-active.png', 1),
            _buildNavItem("Chat bot", 'assets/icons/chatbot-inactive.png',
                "assets/icons/Chatbot.png", 2),
            _buildNavItem("Profile", 'assets/icons/Profile-inactive.png',
                'assets/icons/Profile.png', 3),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupItem(String text, IconData icon) {
    return PopupMenuItem<String>(
      value: text,
      child: Row(
        children: [
          Icon(icon, color: PRIMARY_COLOR, size: 24.sp),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Bungee',
              color: BTN_TEXT_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, String icon, String activeIcon, int index) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Image.asset(
        isSelected ? activeIcon : icon,
        width: isSelected ? 26.w : 22.w,
        height: isSelected ? 26.h : 22.h,
      ),
      label: label,
    );
  }

  String _getHeaderTitle() {
    switch (_selectedIndex) {
      case 0:
        return "LITEREXIA";
      case 1:
        return "Progress";
      case 2:
        return "Chat Bot";
      case 3:
        return "Profile";
      default:
        return "Literexia";
    }
  }

  void _onTappedBar(int value) {
    if (_selectedIndex != value) {
      setState(() {
        _selectedIndex = value;
      });
      _pageController.jumpToPage(value);

      if (value == 0 || value == 3) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            CustomDialog.showEmotionDialog(context);
          }
        });
      }
    }
  }
}
