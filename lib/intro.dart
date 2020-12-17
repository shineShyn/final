import 'package:flutter/material.dart';
import 'package:receipt/login.dart';
import 'package:receipt/register.dart';

class IntroPage extends StatelessWidget {
  final double size = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      width: size,
                      height: size,
                      child: Center(
                        child: Container(
                          child: Center(
                            child: Container(
                              child: Center(
                                child: Container(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Receipt!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  width: size - 150,
                                  height: size - 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(500),
                                  ),
                                ),
                              ),
                              width: size - 100,
                              height: size - 100,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(500),
                              ),
                            ),
                          ),
                          width: size - 50,
                          height: size - 50,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Center(
                      child: FlatButton(
                        child: Container(
                            color: Colors.red.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: FlatButton(
                        child: Container(
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.red.withOpacity(0.6),
                            child: Text(
                              '   Login  ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
