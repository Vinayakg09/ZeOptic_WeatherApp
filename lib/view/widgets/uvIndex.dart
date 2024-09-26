import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyUVIndex extends StatelessWidget {
  final String uvIndex;
  const MyUVIndex(this.uvIndex, {super.key});

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
          Icon(
            Icons.wb_sunny,
            color: Colors.white.withOpacity(0.5),
            size: 50,
          ),
          const SizedBox(width: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UV Index',
                  style: GoogleFonts.roboto(
                      color: Colors.white.withOpacity(0.5), fontSize: 18)),
              Text(uvIndex,
                  style: GoogleFonts.roboto(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
