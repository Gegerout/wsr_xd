import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsr_xd/presentation/home_screen.dart';
import 'package:wsr_xd/presentation/map_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/login_bg.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                )),
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/login_white_bg.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48, top: 300),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: TextFormField(
                      style: GoogleFonts.ubuntu(fontSize: 13),
                      decoration: InputDecoration(
                          hintText: "Login",
                          hintStyle: GoogleFonts.ubuntu(fontSize: 13),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset("assets/images/profile_icon.png")),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48, top: 10),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: TextFormField(
                      style: GoogleFonts.ubuntu(fontSize: 13),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.ubuntu(fontSize: 13),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset("assets/images/email_icon.png")),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48, top: 10),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: TextFormField(
                      obscureText: true,
                      style: GoogleFonts.ubuntu(fontSize: 13),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Password",
                          hintStyle: GoogleFonts.ubuntu(fontSize: 13),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset("assets/images/password_icon.png",)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48, top: 10),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: TextFormField(
                      obscureText: true,
                      style: GoogleFonts.ubuntu(fontSize: 13),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Password",
                          hintStyle: GoogleFonts.ubuntu(fontSize: 13),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset("assets/images/password_icon.png",)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Forgot Password?",
                      style: GoogleFonts.ubuntu(
                          fontSize: 13, color: const Color(0xFFA5A5A5))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    width: 312,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4254BC),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4254BC))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                        },
                        child: Text("SIGN UP",
                            style: GoogleFonts.ubuntu(
                                fontSize: 13, fontWeight: FontWeight.bold)
                        )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
