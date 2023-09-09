import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
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
                    height:MediaQuery.of(context).size.height/1.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/1.6,
                    decoration: BoxDecoration(
                      color: Color(0xFF4E74F9),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
                    ),
                    child: Center(
                      child: Image.asset('assets/books.png', scale:0.8,),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.666,
                  decoration: BoxDecoration(
                    color: Color(0xFF4E74F9),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.666,
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      )
                  ),
                  child: Column(
                    children: [
                      Text("SHIKSHA.TECH",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 2
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Learn And Grow With Us",
                          textAlign:TextAlign.center ,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
