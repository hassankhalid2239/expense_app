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
    double w=MediaQuery.of(context).size.width;
    return Container(
      // width: 170,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: w*0.042),
      // padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(w*0.053)
          // borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
            width: w*0.125,
            // width: 48,
            height: w*0.125,
            // height: 48,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w*0.042)
                // borderRadius: BorderRadius.circular(16)
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  svgPath,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(title,style: GoogleFonts.inter(
                      fontSize: 12,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
                  ),),
                ),
                FittedBox(
                  child: Text(
                    value,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontSize: 22,fontWeight: FontWeight.w600,color: const Color(0xffFCFCFC)
                  ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
