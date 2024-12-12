import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TombolLampu extends StatelessWidget {
  final bool isHidup;
  final VoidCallback onPressed;

  const TombolLampu({
    super.key,
    required this.isHidup,
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
            color: Colors.grey,
            padding: const EdgeInsets.all(16),
            borderRadius: BorderRadius.circular(10),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  isHidup ? "images/lampu.gif" : "images/lampu.png",
                  height: 65,
                ),
                const SizedBox(height: 50),
                Text(
                  isHidup ? "Matikan Lampu" : "Hidupkan Lampu",
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
