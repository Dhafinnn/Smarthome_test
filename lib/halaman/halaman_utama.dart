import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:smarthome/Ruangan/dapur.dart';
import 'package:smarthome/Ruangan/kamar.dart';
import 'package:smarthome/Ruangan/ruangtamu.dart';
import 'package:smarthome/Ruangan/toilet.dart';
import 'package:smarthome/modul%20halaman/button_ruangan.dart';
import 'package:smarthome/modul%20halaman/info_tab.dart';
import 'package:smarthome/modul%20halaman/slider.dart';
import 'package:smarthome/mqtt.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  void initState() {
    jalankanMqtt(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNFhoovR2IvmwKbVIMC11x0LPKP8NoWfZ_6g&s"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dhafin",
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            Text(
                              DateFormat.yMd().add_jm().format(DateTime.now()),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            slide(),
            infotab(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Row(
                children: [
                  tombol(context, "ruangtamu.png", "Ruang Tamu",
                      const Ruangtamu()),
                  const SizedBox(
                    width: 10,
                  ),
                  tombol(context, "dapur.png", "Dapur", const Dapur()),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Row(
                children: [
                  tombol(context, "kamar.png", "Kamar", const Kamar()),
                  const SizedBox(
                    width: 10,
                  ),
                  tombol(context, "toilet.png", "Toilet", const Toilet()),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
