import 'package:expense_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Controller/state_controller.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});
  final _stateController = Get.put(StateController());
  final TextEditingController _categoryController= TextEditingController();
  final TextEditingController _amountController= TextEditingController();
  final _dateController = TextEditingController(
      text: DateFormat('EEE, d MMMM, yyyy, h:mma').format(DateTime.now()));
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
        title: Text('Add Expense',style: GoogleFonts.inter(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Text('Category',style: GoogleFonts.inter(
                      color: Colors.black
                  ),),
                  SizedBox(height: 10,),
              TextFormField(
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    onTap: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return makeDismissible(
                            context: context,
                            child: DraggableScrollableSheet(
                              initialChildSize: 0.52,
                              minChildSize: 0.1,
                              maxChildSize: 0.52,
                              builder: (context, scrollController) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))

                                  ),
                                  child: ListView.builder(
                                    controller: scrollController,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    itemCount: Constants.expenseCategoryIcons.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: ListTile(
                                          onTap: (){
                                            _stateController.expenseCategory.value=Constants.incomeCategoryIcons[index].title;
                                            _categoryController.text=_stateController.expenseCategory.value;
                                            Navigator.pop(context);
                                          },
                                          leading: SvgPicture.asset(Constants.expenseCategoryIcons[index].icon),
                                          title: Text(
                                            Constants.expenseCategoryIcons[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: Color(0xff292B2D),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.grey,size: 30,),
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
                    cursorColor:Colors.transparent,
                  ),
                  SizedBox(height: 15,),
                  Text('Detail',style: GoogleFonts.inter(
                      color: Colors.black
                  ),),
                  SizedBox(height: 10,),
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
                      hintText: 'Add detail',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Color(0xff00A86B),
                  ),
                  SizedBox(height: 15,),
                  Text('Date',style: GoogleFonts.inter(
                      color: Colors.black
                  ),),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) => Theme(
                            data: ThemeData().copyWith(
                                colorScheme: ColorScheme.light(
                                    background: Theme.of(context)
                                        .colorScheme
                                        .background)),
                            child: child!,
                          ),
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        _dateController.text =
                            DateFormat('EEE, d MMMM, yyyy').format(pickedDate);
                      } else {
                        _dateController.text =
                            DateFormat('EEE, d MMMM, yyyy')
                                .format(DateTime.now());
                      }
                    },
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
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Colors.transparent,
                  ),
                  SizedBox(height: 100,),
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
                  // SizedBox(height: 100,),

                ],
              ),
            ),
          ],
        ),
      ),

    );

  }
  Widget makeDismissible({required Widget child,required BuildContext context})=>GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: ()=>Navigator.of(context).pop(),
    child: GestureDetector(onTap: (){},child: child,),
  );
}
