import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InOutContainer extends StatelessWidget {

  final Color bgColor;
  final String title;
  final String value;
  final String svgPath;
  const InOutContainer({super.key,required this.title,required this.bgColor, required this.svgPath,required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 80,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(28)
      ),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(width: 48,height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgPath,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(title,style: GoogleFonts.inter(
                      fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
                  ),),
                  SizedBox(
                    width: 80,
                    child: AutoSizeText(
                      value,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xffFCFCFC)
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
