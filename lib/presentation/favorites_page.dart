import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nav_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  final values = ["Zone 1", "Home", "Work"];

  bool zone = false;
  bool home = false;
  bool work = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const NavBar(),
      appBar: AppBar(
        toolbarHeight: 104,
        backgroundColor: const Color(0xFF2C3043),
        title: Text(
          "Favorites",
          style: GoogleFonts.roboto(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.add_circle, color: Colors.white, size: 34,)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final element = values[index];
          return Dismissible(
              key: Key(element),
              onDismissed: (direction) {
              },
              background: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.restore_from_trash, color: Colors.white,
                          size: 44,),
                      ),
                    ],
                  ),
                ),
              ),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  title: Text(element),
                  trailing: Builder(
                      builder: (context) {
                        if (index == 0) {
                          return CupertinoSwitch(value: zone, onChanged: (
                              value) {
                            setState(() {
                              zone = value;
                            });
                          }, activeColor: Colors.blue,);
                        }
                        else if (index == 1) {
                          return CupertinoSwitch(value: home, onChanged: (
                              value) {
                            setState(() {
                              home = value;
                            });
                          }, activeColor: Colors.blue,);
                        }
                        return CupertinoSwitch(value: work, onChanged: (value) {
                          setState(() {
                            work = value;
                          });
                        }, activeColor: Colors.blue,);
                      }
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
