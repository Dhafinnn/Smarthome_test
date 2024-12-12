import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TombolFan extends StatelessWidget {
  final bool isFan;
  final VoidCallback onPressed;

  const TombolFan({
    super.key,
    required this.isFan,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 220,
          child: CupertinoButton(
            padding: const EdgeInsets.all(16),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  isFan ? "images/kipas.gif" : "images/kipas.png",
                  height: 65,
                ),
                const SizedBox(height: 50),
                Text(
                  isFan ? "Matikan Kipas" : "Hidupkan Kipas",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
