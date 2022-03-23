import 'package:flutter/material.dart';
import 'package:future_jobs/pages/signin_page.dart';
import 'package:google_fonts/google_fonts.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_startedpage.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Build Your Next \nFuture Career Like \na Master',
                    style: GoogleFonts.poppins(
                        color: Color(0xffFFFFFF),
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '18,000 jobs available',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
                  Center(
                    child: Container(
                      width: 200,
                      height: 45,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                              color: Color(0xff4141A4),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
