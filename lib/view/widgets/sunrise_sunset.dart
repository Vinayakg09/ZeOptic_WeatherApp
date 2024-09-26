import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySunriseSunset extends StatelessWidget {
  final String sunrise;
  final String sunset;
  const MySunriseSunset(this.sunrise, this.sunset ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.wb_twilight,
            color: Colors.white,
            size: 50,
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Text("Sunset",
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18)),
                      Text(sunset,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      Text("Sunrise",
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18)),
                      Text(sunrise,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
