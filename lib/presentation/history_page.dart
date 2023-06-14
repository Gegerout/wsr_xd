import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/nav_bar.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: const [
              SizedBox(
                height: 96,
                child: Center(
                  child: ListTile(
                    title: Text("Kia Rio", style: TextStyle(fontSize: 16, color: Color(0xFF78849E)),),
                    subtitle: Text("15 min", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                    trailing: Text("\$15", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(),
              ),
              SizedBox(
                height: 96,
                child: Center(
                  child: ListTile(
                    title: Text("Kia Rio", style: TextStyle(fontSize: 16, color: Color(0xFF78849E)),),
                    subtitle: Text("10 min", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                    trailing: Text("\$10", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(),
              ),
              SizedBox(
                height: 96,
                child: Center(
                  child: ListTile(
                    title: Text("Kia Rio", style: TextStyle(fontSize: 16, color: Color(0xFF78849E)),),
                    subtitle: Text("60 min", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                    trailing: Text("\$50", style: TextStyle(fontSize: 14, color: Color(0xFF78849E)),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(height: 0,),
              ),
            ],
          ),
        ));
  }
}
