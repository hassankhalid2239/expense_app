import 'package:expense_app/Widgets/in_out_container.dart';
import 'package:expense_app/Screens/add_expense.dart';
import 'package:expense_app/Screens/add_income.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final TextEditingController _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset('assets/svg/shop.svg'),
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
            ),
          ],
        ),
      ),
    );
  }
}
