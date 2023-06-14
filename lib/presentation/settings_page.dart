import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/map_page.dart';

import 'nav_bar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3043),
      key: globalKey,
      drawer: const NavBar(),
      appBar: AppBar(
        toolbarHeight: 104,
        backgroundColor: const Color(0xFF2C3043),
        title: Text(
          "History",
          style: GoogleFonts.roboto(fontSize: 20),
        ),
        leading: IconButton(onPressed: () {
          globalKey.currentState?.openDrawer();
        }, icon: const Icon(Icons.menu)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/login_bg.png",
                    width: MediaQuery.of(context).size.width,
                    height: 152,
                    fit: BoxFit.fill,
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Align(alignment: Alignment.topCenter,child: Text("Ivanov Ivan", style: TextStyle(fontSize: 40, color: Colors.white),)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("15 hours", style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.white),),
                    Text("Drive", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                  ],
                ),
                SizedBox(height: 40, child: VerticalDivider(color: Colors.white.withOpacity(0.3), thickness: 1,)),
                Column(
                  children: [
                    Text("\$1510", style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.white),),
                    Text("Paid", style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Text("E-mail: ivanov@gmail.com", style: GoogleFonts.ubuntu(fontSize: 14, color: const Color(0xFF78849E)),),
          TextButton(onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MapPage()), (route) => false);
          }, child: Text("Exit", style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.white),))
        ],
      )
    );
  }
}
