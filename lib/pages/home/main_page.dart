import 'package:flutter/material.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'profile_page.dart';
import 'home_page.dart';
import 'wishlist_page.dart';
import 'profile_page.dart';
import 'chat_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_chart.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_home.png',
                    width: 21,
                    color: currentIndex == 0 ? primaryColor : defaultIconColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_chat.png',
                    width: 20,
                    color: currentIndex == 1 ? primaryColor : defaultIconColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 20,
                    color: currentIndex == 2 ? primaryColor : defaultIconColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_profile.png',
                    width: 20,
                    color: currentIndex == 3 ? primaryColor : defaultIconColor,
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget? body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishListPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default: 0;
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body()
    );
  }
}
