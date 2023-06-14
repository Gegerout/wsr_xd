import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/map_page.dart';

class DrivePage extends StatefulWidget {
  const DrivePage({Key? key}) : super(key: key);

  @override
  State<DrivePage> createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {

  late Timer _timer;
  int _start = 900;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                backgroundColor: const Color(0xFF5F5F5F),
                title: Center(
                  child: Text("Thank you!", style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF5F5F5F)
                    ),
                      onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MapPage()), (route) => false);
                  }, child: Text("Ok", style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xFF80CBC4)),))
                ],
              );
            });
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3043),
      appBar: AppBar(
        leading: Container(),
        toolbarHeight: 104,
        backgroundColor: const Color(0xFF2C3043),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Drive timer",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/login_bg.png",
                width: MediaQuery.of(context).size.width,
                height: 172,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "00:${_start ~/ 60 == 0 ? "00" : _start ~/ 60}:${_start - 60 * (_start ~/ 60) == 0 ? "00" : _start - 60 * (_start ~/ 60)}",
              style: GoogleFonts.ubuntu(fontSize: 56, color: Colors.white),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 327,
              height: 52,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC840E9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text(
                    "STOP",
                    style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
