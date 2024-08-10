import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final VoidCallback;
  const FilterButton({super.key,required this.VoidCallback,required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: VoidCallback,
      child: Text(title,style: GoogleFonts.inter(
        color: Color(0xff91919F),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
