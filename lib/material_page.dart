
import 'package:flutter/material.dart';

class AppMaterialPage extends StatefulWidget{
  const AppMaterialPage({super.key});
  @override
  State<AppMaterialPage> createState()=>_AppMaterialPage();
}
class _AppMaterialPage extends State<AppMaterialPage>{
    double result=0;
    final TextEditingController textEditingController=TextEditingController();
    
  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    const border=OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          ),
         );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title:const Text("Currency Converter"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
         Text(
          "Rs ${result!=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}" ,
           style:const TextStyle(
             fontSize:45,
             fontWeight: FontWeight.bold,
             color: Colors.white,
        ),
        ),
       Padding(
         padding:const EdgeInsets.all(12.0),
         child: TextField(
          controller: textEditingController,
          style:const TextStyle(
            color:Colors.black
          ),
          decoration:const InputDecoration(
           hintText: 'Please enter the amount in USD',
           hintStyle: TextStyle(color: Colors.black),
           prefixIcon:Icon(Icons.monetization_on), 
           prefixIconColor: Colors.black,
           filled: true,
           fillColor: Colors.white,
           focusedBorder:border,
           enabledBorder: border,
          ),
          keyboardType:const TextInputType.numberWithOptions(
            decimal: true,
          ),
         ),
       ),
       Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextButton(
              onPressed:(){
              setState(() {
                 result=double.parse(textEditingController.text)*83.13;
              });
             },
            style:TextButton.styleFrom (
              backgroundColor:Colors.black,
              foregroundColor:Colors.white,
              minimumSize:const Size(double.infinity, 60),
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text('Convert'),
         ),
      ),

      ],
    ),
   ),
  );
  }
}
