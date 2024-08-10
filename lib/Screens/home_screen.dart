import 'package:expense_app/Widgets/in_out_container.dart';
import 'package:expense_app/Screens/add_expense.dart';
import 'package:expense_app/Screens/add_income.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Account Balance',
                  maxLines: 1,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff91919F)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text(
                    '9100',
                    maxLines: 1,
                    style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InOutContainer(
                        title: 'Income',
                        bgColor: Color(0xff00A86B),
                        svgPath: 'assets/svg/Income.svg',
                        value: '5000'),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: InOutContainer(
                        title: 'Expenses',
                        bgColor: Color(0xffFD3C4A),
                        svgPath: 'assets/svg/Outcome.svg',
                        value: '5000'),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        prefixIcon: Icon(Icons.search,color: Color(0xff91919F),),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black,width:2,style: BorderStyle.solid)
                        ),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                          color: Color(0xff91919F),
                          fontSize: 16,
                        ),
                      ),
                      cursorColor: Color(0xff00A86B),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.filter_alt_outlined,color: Color(0xffFD3C4A),size: 30,),
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    // leading: SvgPicture.asset('assets/svg/shop.svg'),
                    title: Text(
                      'Shopping',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        color: Color(0xff292B2D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'Buy some grocery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: FittedBox(
                      child: Text(
                        '1220',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          color: index%2==0?Color(0xffFD3C4A):Color(0xff00A86B),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                    backgroundColor: WidgetStatePropertyAll(Color(0xffFD3C4A))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExpense()));
                },
                child: FittedBox(
                  child: Text('YOU GAVE',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: Colors.white,fontWeight: FontWeight.w600,
                        letterSpacing: 1
                    ),),
                ),
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                    backgroundColor: WidgetStatePropertyAll(Color(0xff00A86B))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddIncome()));
                },
                child: FittedBox(
                  child: Text('YOU GOT',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: Colors.white,fontWeight: FontWeight.w600,
                        letterSpacing: 1
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: SizedBox(
      //   height: 70,width: 70,
      //   child: FloatingActionButton(
      //     backgroundColor: Color(0xff7F3DFF),
      //     shape: CircleBorder(),
      //     onPressed: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTransaction()));
      //     },
      //     child: Icon(Icons.add,size: 35,color: Colors.white,),
      //   ),
      // ),
    );
  }
}
