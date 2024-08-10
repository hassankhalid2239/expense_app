import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction({super.key});
  final TextEditingController _amountController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFD3C4A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xffFD3C4A),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text('Add Transaction',style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('How much?',style: GoogleFonts.inter(
                color: Color(0xffFCFCFC),
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                controller: _amountController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: GoogleFonts.inter(
                      color: Color(0xffFCFCFC),
                      fontSize: 64,
                      fontWeight: FontWeight.w600
                  ),
                ),
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(
                    color: Color(0xffFCFCFC),
                    fontSize: 64,
                    fontWeight: FontWeight.w600
                ),
                cursorColor: Colors.transparent,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  TextFormField(
                    style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16,
            ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black,width:2,style: BorderStyle.solid)
                      ),
                      hintText: 'Categories',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Color(0xffFD3C4A),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black,width:2,style: BorderStyle.solid)
                      ),
                      hintText: 'Description',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Color(0xffFD3C4A),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black,width:2,style: BorderStyle.solid)
                      ),
                      hintText: 'Date',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Color(0xffFD3C4A),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black,width:2,style: BorderStyle.solid)
                      ),
                      hintText: 'Date',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Color(0xffFD3C4A),
                  ),
                  SizedBox(height: 25,),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                        backgroundColor: WidgetStatePropertyAll(Color(0xffFD3C4A),)
                      ),
                      onPressed: (){},
                      child: Text('Add',style: GoogleFonts.inter(
                        color: Color(0xffFCFCFC),
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                 SizedBox(height: 100,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
