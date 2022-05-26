import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobio/constant/constants.dart';
import 'package:google_fonts/google_fonts.dart';


          //  --------- ======================= Common Text ======================  ---------

Widget commonText({String? title, TextStyle? textStyle, TextAlign? textAlign}) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: textStyle), textAlign: textAlign,);
}

         //  --------- ======================= Header One Text ======================  ---------
Widget headerOne({String? title,Color? color,FontWeight? fontWeight }) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: TextStyle(
      color: color, fontSize: 78.sp,fontWeight: fontWeight,)),);
}

//  --------- ======================= Header two Text ======================  ---------
Widget headerTwo({String? title,Color? color,FontWeight? fontWeight }) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: TextStyle(
    color: color, fontSize: 70.sp,fontWeight: fontWeight,)),);
}

//  --------- ======================= Header three Text ======================  ---------
Widget headerThree({String? title,Color? color,FontWeight? fontWeight }) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: TextStyle(
    color: color, fontSize: 50.sp,fontWeight: fontWeight,)),);
}

//  --------- ======================= Large Text ======================  ---------
Widget  largeText({String? title,Color? color,FontWeight? fontWeight }) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: TextStyle(
    color: color, fontSize: 45.sp,fontWeight: fontWeight,)),);
}

//  --------- ======================= Small Text ======================  ---------
Widget smallText({String? title,Color? color,FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(title ?? "" , style: GoogleFonts.poppins(textStyle: TextStyle(
    color: color, fontSize: 37.sp,fontWeight: fontWeight,)),textAlign: textAlign,);
}


//                ------------------------------------------------------------
//  --------- ======================= Common Button  ======================  ---------
//                ------------------------------------------------------------
Widget commonButton({ Function()? onTap, Color? buttonColor,Color? textColor, double? buttonWidth ,
   String? buttonName, double? buttonHeight,double? textSize}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(70.r)

      ),
      height: buttonHeight ?? 50,
      width: buttonWidth,
      child: Align(
          alignment: Alignment.center,
          child: commonText(title: buttonName, textStyle: TextStyle(color: textColor, fontSize: textSize ?? 15) )),
    ),
  );
}

//                        ================================
//      ======================= Custom TextFormField take icon ======================
//                        ================================
  Widget commonTextFormField({void Function(String?)? onSaved,String? Function(dynamic)? validator,
    bool obscureText = false,TextEditingController? controller , String? hintText, Function()? onTap,
    bool readOnly = false, String? initialValue, IconData? prefixIcon, Widget? suffixIcon,
  }) {
    return TextFormField(

      style: TextStyle(color: Colors.black,),
      decoration: InputDecoration(

          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: Colors.black26),
          hintText: hintText,
          filled: true,
          fillColor: lightGreenColor.withOpacity(0.4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(70.r),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(70.r),
              borderSide: BorderSide(
                color: Colors.transparent,),
          )
      ),
      initialValue: initialValue,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      onTap: onTap,
    );
}

//                        ================================
//      ======================= Custom TextFormField take icon ======================
//                        ================================
Widget commonTextFormFieldForImage({void Function(String?)? onSaved,String? Function(dynamic)? validator,
  bool obscureText = false,TextEditingController? controller , String? hintText, Function()? onTap,
  bool readOnly = false, String? initialValue, String? prefixIcon, Widget? suffixIcon, Widget? widget,
  TextInputType? keyboardType
}) {
  return TextFormField(
    keyboardType: keyboardType,
    style: TextStyle(color: Colors.black,),
    decoration: InputDecoration(
        prefixIcon:  Container(
          width: 170.w,
          decoration: BoxDecoration(
              color: Colors.transparent
          ),
          child: Row(
            children: [
              SizedBox(width: 40.w,),
              Image(image: AssetImage(prefixIcon!),fit: BoxFit.scaleDown, height: 60.h,width: 60.w),
              SizedBox(width: 30.w,),
              Container(
                height: 80.h,
                width: 3.w,
                color: Colors.black54,
              ),
              SizedBox(width: 30.w,),
            ],),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
          borderSide: BorderSide(
            color: Colors.transparent,),
        )
    ),
    initialValue: initialValue,
    readOnly: readOnly,
    controller: controller,
    obscureText: obscureText,
    onSaved: onSaved,
    validator: validator,
    onTap: onTap,
  );
}

// -- ====  app bar for user auth ==== ---
AppBar appBar({String? title, Widget? leadingWidget , List<Widget>? action }) {
  return AppBar(
    title: commonText(
        title: title,textStyle:
    TextStyle(color: Colors.black,fontSize: 50.sp,fontWeight: FontWeight.w500)
    ),
    centerTitle: true,
    backgroundColor: bgColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: leadingWidget,
    actions: action,
    // leadingWidth: 200.w,
  );
}

Row textOrderWidget({String? title, String? value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      smallText(
        title: title,
        color: blackColor,
      ),
      smallText(
          title: value,
          color: blackColor,
          fontWeight: FontWeight.w600
      ),
    ],);
}

Widget imageWidget({double? height, double? width, String? image }) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(image: AssetImage(image!),fit: BoxFit.scaleDown)),
  );
}

Widget onBoardingWidget({ String? image }) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: greenColor,
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image!),fit: BoxFit.scaleDown)
      ),
    // child: Center(child: Icon(CupertinoIcons.heart_fill,size: 30,color: Color(0xffcff85e),))
  );
}

