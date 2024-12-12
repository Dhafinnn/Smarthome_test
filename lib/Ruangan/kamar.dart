import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarthome/modul%20ruangan/tombol_lampu.dart';
import 'package:smarthome/mqtt.dart';
import 'package:smarthome/providers/lampu_provider.dart';

class Kamar extends StatefulWidget {
  const Kamar({super.key});

  @override
  State<Kamar> createState() => _KamarState();
}

class _KamarState extends State<Kamar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.8),
              Colors.grey.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Text(
                  "SmartHome",
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kamar",
                  style: GoogleFonts.poppins(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Hapus Ruangan",
                      style: GoogleFonts.poppins(color: Colors.red),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(color: Colors.black, thickness: 5),
                const SizedBox(height: 10),
                Consumer<LampuProvider>(
                  builder: (context, status, _) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TombolLampu(
                              isHidup: status.isHidup3,
                              onPressed: () {
                                if (status.isHidup3) {
                                  kirimPesan("22022");
                                } else {
                                  kirimPesan("22122");
                                }
                                status.statusLampu3(!status.isHidup3);
                              })
                        ],
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
