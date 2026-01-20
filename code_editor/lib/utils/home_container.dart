import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContainer extends StatelessWidget {
  final String title;
  final String image;
  const HomeContainer({super.key,required this.title,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(2, 2,),
            blurRadius: 10,
          )
        ]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                )
            ),
            Text(
              title,
              style: GoogleFonts.dotGothic16(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
                letterSpacing: 3
              ),
            )
          ],
        ),
      ),
    );
  }
}
