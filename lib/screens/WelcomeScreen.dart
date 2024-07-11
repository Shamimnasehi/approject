import 'package:Daneshjooyar/screens/LoginPage.dart';
import 'package:Daneshjooyar/screens/SignupPage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade900,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70)),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                  color: Colors.teal.shade900,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'به دانشجویار خوش آمدید!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Baloo',
                        letterSpacing: 2,
                        wordSpacing: 2,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Material(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "ورود",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Baloo',
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Material(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignupPage(),
                                          ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "ثبت نام",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Baloo',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
