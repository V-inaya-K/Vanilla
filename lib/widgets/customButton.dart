import 'package:flutter/material.dart';

class customButton extends StatelessWidget{
  
  final String btnname;

  customButton({
      required this.btnname, 
      this.icon, 
      this.bgcolor=Colors.blue, 
      this.textStyle, 
      this.callback});

  final Icon? icon; //'?'denotes hat icon can be null.
  final Color bgcolor;
  final TextStyle? textStyle; //Can be null.
  final VoidCallback? callback;//Can be null.
// 'alt+insert' to make constructors.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      callback!();
    }, 
    child: icon!=null ? Row(
      children: [
        icon!,
        Text(btnname,style: textStyle,)
      ],

    ):Text(btnname,style: textStyle,),
    style: ElevatedButton.styleFrom(
      shadowColor: bgcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(11)),
      )

    ),
    );
  }

}