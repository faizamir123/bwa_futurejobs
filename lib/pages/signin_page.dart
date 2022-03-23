import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs/pages/home_page.dart';
import 'package:future_jobs/pages/signup_page.dart';
import 'package:future_jobs/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                top: 30,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Build Your Career',
                    style: subTitleTextStyle,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/pic1_signin_page.png',
                      height: 240,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: titleTextStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          controller: emailController,
                          onChanged: (value) {
                            print(value);
                            bool isValid = EmailValidator.validate(value);
                            print(isValid);
                            if (isValid) {
                              setState(() {
                                isEmailValid = true;
                              });
                            } else {
                              setState(() {
                                isEmailValid = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: Color(0xffF1F0F5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: isEmailValid
                                    ? Color(0xff4141A4)
                                    : Color(0xffFD4F56),
                              ),
                            ),
                            hintText: '',
                          ),
                          style: TextStyle(
                            color: isEmailValid
                                ? Color(0xff04141A4)
                                : Color(0xffFD4F56),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: titleTextStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF1F0F5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: Color(0xff04141A4),
                              ),
                            ),
                            hintText: '',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        height: 45,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff4141A4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            'Create New Account',
                            style: GoogleFonts.poppins(
                              color: Color(0xffB3B5C4),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}