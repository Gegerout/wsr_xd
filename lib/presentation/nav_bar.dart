import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/favorites_page.dart';
import 'package:wsr_xd/presentation/history_page.dart';
import 'package:wsr_xd/presentation/map_page.dart';
import 'package:wsr_xd/presentation/settings_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3043),
        toolbarHeight: 104,
        leadingWidth: 60,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20,
            child: Icon(Icons.person),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.menu))
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ivanov Ivan",
              style:
                  GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Rostov",
              style:
                  GoogleFonts.ubuntu(fontWeight: FontWeight.w400, fontSize: 14),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Drawer(
        backgroundColor: const Color(0xFF2C3043),
        child: Column(
          children: [
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 6, left: 14),
                child: Image.asset("assets/images/menu_icon.png"),
              ),
              title: Text(
                "History",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 6, left: 14),
                child: Image.asset("assets/images/favorites_icon.png"),
              ),
              title: Text(
                "Favorites",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 6, left: 14),
                child: Image.asset("assets/images/settings_icon.png"),
              ),
              title: Text(
                "Settings",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                    child: Text(
                  "Privacy Policy",
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
