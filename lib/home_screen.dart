import 'package:expense_app/Widgets/in_out_container.dart';
import 'package:expense_app/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Account Balance',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff91919F)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '9100',
                  style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    InOutContainer(
                        title: 'Income',
                        bgColor: Color(0xff00A86B),
                        svgPath: 'assets/svg/Income.svg',
                        value: '5000'),
                    InOutContainer(
                        title: 'Expenses',
                        bgColor: Color(0xffFD3C4A),
                        svgPath: 'assets/svg/Outcome.svg',
                        value: '5000')
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Recent Transactions',
                style: TextStyle(
                    color: Color(0xff292B2D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/svg/shop.svg'),
                    title: Text(
                      'Shopping',
                      style: GoogleFonts.inter(
                        color: Color(0xff292B2D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Buy some grocery',
                      style: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      '1220',
                      style: GoogleFonts.inter(
                        color: Color(0xffFD3C4A),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,width: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xff7F3DFF),
          shape: CircleBorder(),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTransaction()));
          },
          child: Icon(Icons.add,size: 35,color: Colors.white,),
        ),
      ),
    );
  }
}
