import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/drive_page.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DrivePage()), (route) => false);
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
        toolbarHeight: 104,
        leading: Container(),
        backgroundColor: const Color(0xFF2C3043),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Wait timer",
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
                  onPressed: () {
                    _timer.cancel();
                  },
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
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 327,
              height: 52,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB900),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
