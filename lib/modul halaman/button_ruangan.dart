import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tombol(
  BuildContext context,
  String iconGambar,
  String nama,
  Widget ruangan
) {
  return Flexible(
    flex: 1,
    child: SizedBox(
      height: 170,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ruangan));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.asset("images/$iconGambar"),
              ),
              Text(
                nama,
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
