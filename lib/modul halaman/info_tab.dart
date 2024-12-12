import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarthome/providers/lampu_provider.dart';
import 'package:weather_icons/weather_icons.dart';

Widget infotab() {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const BoxedIcon(
                  WeatherIcons.thermometer,
                  size: 40,
                ),
                const SizedBox(height: 10),
                Consumer<LampuProvider>(builder: (context, status, _) {
                  return Text(
                    "${status.suhu}°",
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.center,
                  );
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Consumer<LampuProvider>(builder: (context, status, _) {
              return Column(
                children: [
                  Icon(
                    status.isDoor
                        ? Icons.thumb_up_rounded
                        : Icons.thumb_down_rounded,
                    size: 40,
                    color: status.isDoor ? Colors.green : Colors.red,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    status.isDoor ? "Pintu Terbuka" : "Pintu Tertutup",
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            }),
          ),
          const SizedBox(
            height: 100,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const BoxedIcon(
                  WeatherIcons.humidity,
                  size: 40,
                ),
                const SizedBox(height: 10),
                Consumer<LampuProvider>(builder: (context, status, _) {
                  return Text(
                    "${status.humidity}°",
                    style: GoogleFonts.poppins(),
                    textAlign: TextAlign.center,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
